<#
.SYNOPSIS
    Generates MegaTUI installation profiles from package lists

.DESCRIPTION
    This script helps create and manage MegaTUI installation profiles.
    It can create new profiles, merge existing profiles, and validate package IDs.

.PARAMETER ProfileName
    Name of the profile to create or modify

.PARAMETER Packages
    Array of package identifiers to include in the profile

.PARAMETER MergeWith
    Name of existing profile to merge packages with

.PARAMETER ListProfiles
    List all available profiles in the MegaTUI-Profiles directory

.PARAMETER Validate
    Validate that all packages in a profile exist in winget

.EXAMPLE
    .\Generate-MegaTUI-Profile.ps1 -ProfileName MyDevStack -Packages @("Microsoft.VisualStudioCode", "Git.Git", "Nodejs.Nodejs")

.EXAMPLE
    .\Generate-MegaTUI-Profile.ps1 -ProfileName EnhancedDevStack -MergeWith DevStack -Packages @("Docker.DockerDesktop", "Postman.Postman")

.EXAMPLE
    .\Generate-MegaTUI-Profile.ps1 -ListProfiles

.EXAMPLE
    .\Generate-MegaTUI-Profile.ps1 -ProfileName DevStack -Validate
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$ProfileName,

    [Parameter(Mandatory = $false)]
    [string[]]$Packages,

    [Parameter(Mandatory = $false)]
    [string]$MergeWith,

    [Parameter(Mandatory = $false)]
    [switch]$ListProfiles,

    [Parameter(Mandatory = $false)]
    [switch]$Validate,

    [Parameter(Mandatory = $false)]
    [string]$ProfilesPath = "$PSScriptRoot\MegaTUI-Profiles"
)

function Write-ColorOutput {
    param([string]$Message, [string]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

function Get-ProfilePath {
    param([string]$Name)
    return Join-Path $ProfilesPath "$Name.json"
}

function Get-AllProfiles {
    if (-not (Test-Path $ProfilesPath)) {
        New-Item -ItemType Directory -Path $ProfilesPath -Force | Out-Null
        return @()
    }
    
    $profileFiles = Get-ChildItem -Path $ProfilesPath -Filter "*.json" -File
    return $profileFiles | ForEach-Object {
        [PSCustomObject]@{
            Name = $_.BaseName
            FullPath = $_.FullName
            LastModified = $_.LastWriteTime
            PackageCount = (Get-ProfilePackages -ProfileName $_.BaseName).Count
        }
    }
}

function Get-ProfilePackages {
    param([string]$ProfileName)
    
    $profilePath = Get-ProfilePath -Name $ProfileName
    if (-not (Test-Path $profilePath)) {
        Write-ColorOutput "Profile '$ProfileName' not found at $profilePath" "Red"
        return @()
    }
    
    try {
        $json = Get-Content -Path $profilePath -Raw | ConvertFrom-Json
        $packages = @()
        foreach ($source in $json.Sources) {
            foreach ($pkg in $source.Packages) {
                $packages += $pkg.PackageIdentifier
            }
        }
        return $packages
    } catch {
        Write-ColorOutput "Error reading profile: $($_.Exception.Message)" "Red"
        return @()
    }
}

function Save-Profile {
    param(
        [string]$Name,
        [string[]]$PackageIDs
    )
    
    # Ensure profiles directory exists
    if (-not (Test-Path $ProfilesPath)) {
        New-Item -ItemType Directory -Path $ProfilesPath -Force | Out-Null
        Write-ColorOutput "Created profiles directory: $ProfilesPath" "Green"
    }
    
    # Remove duplicates and sort
    $uniquePackages = $PackageIDs | Sort-Object -Unique
    
    $obj = @{
        Sources = @(
            @{
                Packages = ($uniquePackages | ForEach-Object { 
                    @{ PackageIdentifier = $_ } 
                })
            }
        )
    }
    
    $profilePath = Get-ProfilePath -Name $Name
    $json = $obj | ConvertTo-Json -Depth 5
    
    Set-Content -Path $profilePath -Value $json -Encoding UTF8
    Write-ColorOutput "✓ Profile saved: $Name ($($uniquePackages.Count) packages)" "Green"
    Write-ColorOutput "  Location: $profilePath" "Cyan"
}

function Test-PackageExists {
    param([string]$PackageId)
    
    try {
        $result = winget search --id $PackageId --source winget 2>$null
        return ($result -match [regex]::Escape($PackageId))
    } catch {
        return $false
    }
}

function Validate-Profile {
    param([string]$ProfileName)
    
    Write-ColorOutput "`nValidating profile: $ProfileName" "Cyan"
    Write-ColorOutput "=" * 60 "Cyan"
    
    $packages = Get-ProfilePackages -ProfileName $ProfileName
    if ($packages.Count -eq 0) {
        Write-ColorOutput "Profile is empty or not found" "Red"
        return
    }
    
    $valid = @()
    $invalid = @()
    
    Write-ColorOutput "Checking $($packages.Count) packages..." "Yellow"
    
    foreach ($pkg in $packages) {
        Write-Host -NoNewline "  Checking $pkg... "
        if (Test-PackageExists -PackageId $pkg) {
            Write-ColorOutput "✓" "Green"
            $valid += $pkg
        } else {
            Write-ColorOutput "✗" "Red"
            $invalid += $pkg
        }
    }
    
    Write-ColorOutput "`nValidation Results:" "Cyan"
    Write-ColorOutput "  Valid packages: $($valid.Count)" "Green"
    Write-ColorOutput "  Invalid packages: $($invalid.Count)" "Red"
    
    if ($invalid.Count -gt 0) {
        Write-ColorOutput "`nInvalid packages:" "Yellow"
        foreach ($pkg in $invalid) {
            Write-ColorOutput "  - $pkg" "Red"
        }
    }
}

# Main execution
if ($ListProfiles) {
    Write-ColorOutput "`nAvailable MegaTUI Profiles:" "Cyan"
    Write-ColorOutput "=" * 60 "Cyan"
    
    $profiles = Get-AllProfiles
    if ($profiles.Count -eq 0) {
        Write-ColorOutput "No profiles found in $ProfilesPath" "Yellow"
    } else {
        foreach ($profile in $profiles) {
            Write-ColorOutput "`n  Profile: $($profile.Name)" "White"
            Write-ColorOutput "    Packages: $($profile.PackageCount)" "Gray"
            Write-ColorOutput "    Modified: $($profile.LastModified.ToString('yyyy-MM-dd HH:mm:ss'))" "Gray"
        }
        Write-ColorOutput "`n" ""
    }
    exit
}

if ($Validate -and $ProfileName) {
    Validate-Profile -ProfileName $ProfileName
    exit
}

if (-not $ProfileName) {
    Write-ColorOutput "Error: ProfileName is required (unless using -ListProfiles or -Validate)" "Red"
    exit 1
}

if (-not $Packages -and -not $MergeWith) {
    Write-ColorOutput "Error: Either -Packages or -MergeWith must be specified" "Red"
    exit 1
}

$finalPackages = @()

# Start with packages from existing profile if merging
if ($MergeWith) {
    $existingPackages = Get-ProfilePackages -ProfileName $MergeWith
    if ($existingPackages.Count -gt 0) {
        $finalPackages += $existingPackages
        Write-ColorOutput "Merging with profile '$MergeWith' ($($existingPackages.Count) packages)" "Cyan"
    } else {
        Write-ColorOutput "Warning: Profile '$MergeWith' not found or empty" "Yellow"
    }
}

# Add new packages
if ($Packages) {
    $finalPackages += $Packages
    Write-ColorOutput "Adding $($Packages.Count) package(s)" "Cyan"
}

# Save the profile
if ($finalPackages.Count -gt 0) {
    Save-Profile -Name $ProfileName -PackageIDs $finalPackages
} else {
    Write-ColorOutput "Error: No packages to save" "Red"
    exit 1
}