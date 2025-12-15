<#
.SYNOPSIS
Detects and safely removes duplicate entries of files/folders/shortcuts across common install/shell locations,
and duplicate registry entries (Explorer NameSpace and Uninstall keys).

.PARAMETER DryRun
If specified, no deletions are performed; actions are logged for review.

.PARAMETER LogPath
Optional path to write a log file.

.NOTES
Run in an elevated PowerShell session for full registry access. A registry backup is exported before any change.
#>

[CmdletBinding()]
param(
    [switch]$DryRun,
    [string]$LogPath = (Join-Path $env:TEMP ("DupClean_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".log"))
)

# =========================
# Helper functions
# =========================

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $line = "[{0}] {1}: {2}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Level, $Message
    Write-Host $line
    Add-Content -Path $LogPath -Value $line
}

function Normalize-Path {
    param([string]$Path)
    if (-not $Path) { return $null }
    # Resolve environment variables and normalize casing + separators
    $expanded = [Environment]::ExpandEnvironmentVariables($Path)
    $full = $expanded
    try { $full = (Resolve-Path -LiteralPath $expanded -ErrorAction SilentlyContinue).Path } catch {}
    return ($full -replace '/', '\' ).ToLowerInvariant()
}

function Get-ShortcutTarget {
    param([string]$LinkPath)
    try {
        $shell = New-Object -ComObject WScript.Shell
        $shortcut = $shell.CreateShortcut($LinkPath)
        return (Normalize-Path $shortcut.TargetPath)
    } catch {
        return $null
    }
}

function Safe-DeleteFile {
    param([string]$Path)
    Write-Log "Delete file: $Path" "ACTION"
    if ($DryRun) { return }
    Remove-Item -LiteralPath $Path -Force -ErrorAction Stop
}

function Safe-DeleteFolder {
    param([string]$Path)
    Write-Log "Delete folder: $Path" "ACTION"
    if ($DryRun) { return }
    Remove-Item -LiteralPath $Path -Force -Recurse -ErrorAction Stop
}

function Safe-RemoveRegistryKey {
    param([string]$HivePath)
    Write-Log "Delete registry key: $HivePath" "ACTION"
    if ($DryRun) { return }
    Remove-Item -Path $HivePath -Recurse -Force -ErrorAction Stop
}

function Export-RegistryBackup {
    param([string]$RegRoot, [string]$OutFile)
    Write-Log "Exporting registry backup: $RegRoot => $OutFile" "BACKUP"
    if ($DryRun) { return }
    $regExe = Join-Path $env:SystemRoot "System32\reg.exe"
    & $regExe export $RegRoot $OutFile /y | Out-Null
}

# =========================
# Scan locations (files/folders/shortcuts)
# =========================

# Common paths to scan
$pathsToScan = @(
    "$env:ProgramFiles",
    "$env:ProgramFiles(x86)",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs",
    "$env:AppData\Microsoft\Windows\Start Menu\Programs",
    "$env:Public\Desktop",
    "$env:USERPROFILE\Desktop",
    "$env:USERPROFILE\AppData\Local\Programs",
    "$env:USERPROFILE\AppData\Roaming"
) | Where-Object { $_ -and (Test-Path $_) }

Write-Log "Scanning file system for duplicates..."
$entries = New-Object System.Collections.Generic.List[Object]

foreach ($base in $pathsToScan) {
    Get-ChildItem -LiteralPath $base -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
        $item = $_
        $obj = [PSCustomObject]@{
            Type       = if ($item.PSIsContainer) { "Folder" } elseif ($item.Extension -ieq ".lnk") { "Shortcut" } else { "File" }
            Name       = $item.Name
            FullPath   = $item.FullName
            BaseRoot   = $base
            TargetPath = $null
            SizeBytes  = if (-not $item.PSIsContainer) { $item.Length } else { $null }
        }
        if ($obj.Type -eq "Shortcut") {
            $obj.TargetPath = Get-ShortcutTarget -LinkPath $item.FullName
        }
        $entries.Add($obj)
    }
}

# Group duplicates by normalized name and/or identical target
$byName = $entries | Group-Object { $_.Name.ToLowerInvariant() } | Where-Object { $_.Count -gt 1 }
$byTarget = $entries | Where-Object { $_.TargetPath } | Group-Object { $_.TargetPath } | Where-Object { $_.Count -gt 1 }

Write-Log ("Found {0} duplicate groups by name, {1} duplicate groups by target" -f $byName.Count, $byTarget.Count)

# =========================
# Scan registry for duplicates
# =========================

Write-Log "Scanning registry for duplicates..."

$resultsRegistry = [System.Collections.Generic.List[Object]]::new()

# Explorer NameSpace (left pane items)
$nsPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"
)
foreach ($ns in $nsPaths) {
    if (Test-Path $ns) {
        Get-ChildItem $ns -ErrorAction SilentlyContinue | ForEach-Object {
            $guid = $_.PSChildName
            $def  = (Get-ItemProperty -Path $_.PSPath -ErrorAction SilentlyContinue)."(default)"
            $resultsRegistry.Add([PSCustomObject]@{
                Area       = "Explorer NameSpace"
                HivePath   = "$ns\$guid"
                KeyName    = $guid
                Display    = $def
            })
        }
    }
}

# Uninstall keys (Programs & Features)
$uninstallPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
)
foreach ($up in $uninstallPaths) {
    if (Test-Path $up) {
        Get-ChildItem $up -ErrorAction SilentlyContinue | ForEach-Object {
            $p = Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue
            $name = $p.DisplayName
            if ([string]::IsNullOrWhiteSpace($name)) { return }
            $resultsRegistry.Add([PSCustomObject]@{
                Area       = "Uninstall"
                HivePath   = $_.PSPath
                KeyName    = $_.PSChildName
                Display    = $name
                Publisher  = $p.Publisher
                Version    = $p.DisplayVersion
            })
        }
    }
}

# Group registry duplicates by display name
$dupeNS = $resultsRegistry | Where-Object { $_.Area -eq "Explorer NameSpace" -and $_.Display } | Group-Object Display | Where-Object { $_.Count -gt 1 }
$dupeUninstall = $resultsRegistry | Where-Object { $_.Area -eq "Uninstall" } | Group-Object Display | Where-Object { $_.Count -gt 1 }

Write-Log ("Registry duplicates: NameSpace groups={0}, Uninstall groups={1}" -f $dupeNS.Count, $dupeUninstall.Count)

# =========================
# Present findings
# =========================

function Show-DuplicateGroup {
    param([string]$Title, $Group)
    Write-Host "`n=== $Title ===" -ForegroundColor Cyan
    $i = 0
    foreach ($g in $Group) {
        $i++
        Write-Host ("[{0}] Key: {1}" -f $i, $g.Name) -ForegroundColor Yellow
        $g.Group | Format-Table Type, Name, FullPath, TargetPath, BaseRoot, SizeBytes -AutoSize
    }
}

function Show-RegistryGroup {
    param([string]$Title, $Group)
    Write-Host "`n=== $Title ===" -ForegroundColor Cyan
    $i = 0
    foreach ($g in $Group) {
        $i++
        Write-Host ("[{0}] Display: {1}" -f $i, $g.Name) -ForegroundColor Yellow
        $g.Group | Format-Table Area, HivePath, KeyName, Display, Publisher, Version -AutoSize
    }
}

Show-DuplicateGroup -Title "File system duplicates by name" -Group $byName
Show-DuplicateGroup -Title "File system duplicates by shortcut target" -Group $byTarget
Show-RegistryGroup  -Title "Registry duplicates: Explorer NameSpace" -Group $dupeNS
Show-RegistryGroup  -Title "Registry duplicates: Uninstall entries" -Group $dupeUninstall

# =========================
# Confirm deletions
# =========================

Write-Host "`nDryRun: $DryRun  |  Log: $LogPath" -ForegroundColor Green

# Backup registry roots before changes
$backupDir = Join-Path $env:TEMP ("DupCleanReg_" + (Get-Date -Format "yyyyMMdd_HHmmss"))
New-Item -Path $backupDir -ItemType Directory -Force | Out-Null
Export-RegistryBackup -RegRoot "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace" -OutFile (Join-Path $backupDir "NameSpace_HKCU.reg")
Export-RegistryBackup -RegRoot "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace" -OutFile (Join-Path $backupDir "NameSpace_HKLM.reg")
Export-RegistryBackup -RegRoot "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" -OutFile (Join-Path $backupDir "Uninstall_HKLM.reg")
Export-RegistryBackup -RegRoot "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" -OutFile (Join-Path $backupDir "Uninstall_WOW6432.reg")
Export-RegistryBackup -RegRoot "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall" -OutFile (Join-Path $backupDir "Uninstall_HKCU.reg")

# Selection helpers
function Select-Indices {
    param([int]$MaxIndex)
    $input = Read-Host "Enter group indices to clean (comma-separated), or press Enter to skip"
    if ([string]::IsNullOrWhiteSpace($input)) { return @() }
    $indices = $input -split "," | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ }
    return ($indices | Where-Object { $_ -ge 1 -and $_ -le $MaxIndex })
}

# Clean file system duplicates by name
if ($byName.Count -gt 0) {
    Write-Host "`nChoose file system duplicate groups by NAME to clean." -ForegroundColor Cyan
    $sel = Select-Indices -MaxIndex $byName.Count
    foreach ($idx in $sel) {
        $group = $byName[$idx-1].Group
        # Keep the first entry, offer to remove the rest
        $keep = $group | Select-Object -First 1
        Write-Log "Keeping: $($keep.FullPath)"
        $toRemove = $group | Select-Object -Skip 1
        foreach ($item in $toRemove) {
            if ($item.Type -eq "Folder") { Safe-DeleteFolder -Path $item.FullPath }
            else { Safe-DeleteFile -Path $item.FullPath }
        }
    }
}

# Clean file system duplicates by target
if ($byTarget.Count -gt 0) {
    Write-Host "`nChoose duplicate groups by SHORTCUT TARGET to clean." -ForegroundColor Cyan
    $sel = Select-Indices -MaxIndex $byTarget.Count
    foreach ($idx in $sel) {
        $group = $byTarget[$idx-1].Group
        # Keep Start Menu entry under ProgramData if present; remove others
        $keep = $group | Where-Object { $_.FullPath -like "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\*" } | Select-Object -First 1
        if (-not $keep) { $keep = $group | Select-Object -First 1 }
        Write-Log "Keeping: $($keep.FullPath)"
        $toRemove = $group | Where-Object { $_.FullPath -ne $keep.FullPath }
        foreach ($item in $toRemove) {
            if ($item.Type -eq "Folder") { Safe-DeleteFolder -Path $item.FullPath }
            else { Safe-DeleteFile -Path $item.FullPath }
        }
    }
}

# Clean registry: Explorer NameSpace
if ($dupeNS.Count -gt 0) {
    Write-Host "`nChoose NameSpace duplicate groups to clean (left pane items)." -ForegroundColor Cyan
    $sel = Select-Indices -MaxIndex $dupeNS.Count
    foreach ($idx in $sel) {
        $group = $dupeNS[$idx-1].Group
        # Heuristic: keep HKLM entry, remove HKCU duplicates if present
        $keep = $group | Where-Object { $_.HivePath -like "HKLM:*" } | Select-Object -First 1
        if (-not $keep) { $keep = $group | Select-Object -First 1 }
        Write-Log "Keeping registry: $($keep.HivePath)"
        $toRemove = $group | Where-Object { $_.HivePath -ne $keep.HivePath }
        foreach ($key in $toRemove) { Safe-RemoveRegistryKey -HivePath $key.HivePath }
    }
}

# Clean registry: Uninstall duplicates
if ($dupeUninstall.Count -gt 0) {
    Write-Host "`nChoose Uninstall duplicate groups to clean (Programs & Features entries)." -ForegroundColor Cyan
    $sel = Select-Indices -MaxIndex $dupeUninstall.Count
    foreach ($idx in $sel) {
        $group = $dupeUninstall[$idx-1].Group
        # Heuristic: keep the entry with highest version or HKLM x64 first
        $ordered = $group | Sort-Object -Property @{Expression="Version";Descending=$true}, @{Expression="HivePath";Descending=$false}
        $keep = $ordered | Select-Object -First 1
        Write-Log "Keeping uninstall key: $($keep.HivePath) [$($keep.Version)]"
        $toRemove = $group | Where-Object { $_.HivePath -ne $keep.HivePath }
        foreach ($key in $toRemove) { Safe-RemoveRegistryKey -HivePath $key.HivePath }
    }
}

Write-Host "`nDone. Review the log for details:" -ForegroundColor Green
Write-Host $LogPath
Write-Host "If you ran with -DryRun, rerun without it to apply changes." -ForegroundColor Yellow
