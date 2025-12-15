Clear-Host
Write-Host ""
Write-Host "========================================================"
Write-Host ""
Write-Host "        __  __      _ ______     __  __  ______" -ForegroundColor Cyan
Write-Host "       / / / /___  (_) ____/__  / /_/ / / /  _/" -ForegroundColor Cyan
Write-Host "      / / / / __ \/ / / __/ _ \/ __/ / / // /" -ForegroundColor Cyan
Write-Host "     / /_/ / / / / / /_/ /  __/ /_/ /_/ // /" -ForegroundColor Cyan
Write-Host "     \____/_/ /_/_/\____/\___/\__/\____/___/" -ForegroundColor Cyan
Write-Host "          UniGetUI Package Installer Script" 
Write-Host "        Created with UniGetUI Version 3.3.6"
Write-Host ""
Write-Host "========================================================"
Write-Host ""
Write-Host "NOTES:" -ForegroundColor Yellow
Write-Host "  - The install process will not be as reliable as importing a bundle with UniGetUI. Expect issues and errors." -ForegroundColor Yellow
Write-Host "  - Packages will be installed with the install options specified at the time of creation of this script." -ForegroundColor Yellow
Write-Host "  - Error/Sucess detection may not be 100% accurate." -ForegroundColor Yellow
Write-Host "  - Some of the packages may require elevation. Some of them may ask for permission, but others may fail. Consider running this script elevated." -ForegroundColor Yellow
Write-Host "  - You can skip confirmation prompts by running this script with the parameter `/DisablePausePrompts` " -ForegroundColor Yellow
Write-Host ""
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
Write-Host ""
Write-Host "This script will attempt to install the following packages:"
Write-Host "  - Snappy Driver Installer Origin from WinGet"
Write-Host "  - lazygit from WinGet"
Write-Host "  - PowerShellForGitH. from PowerShell 7.x"
Write-Host "  - Logging from PowerShell 7.x"
Write-Host "  - Files from WinGet"
Write-Host "  - Visual Studio / Code for Command Palette from WinGet"
Write-Host "  - Admin from PowerShell 7.x"
Write-Host "  - LocalAccounts from PowerShell 7.x"
Write-Host "  - Git from WinGet"
Write-Host "  - 7Zip4Powershell from PowerShell 7.x"
Write-Host "  - Oracle VirtualBox from WinGet"
Write-Host "  - Duplicati 2 from WinGet"
Write-Host "  - Posh SYSLOG from PowerShell 7.x"
Write-Host "  - TextTable from PowerShell 7.x"
Write-Host "  - Admin from PowerShell 7.x"
Write-Host "  - Neovim from WinGet"
Write-Host "  - SoftPerfect RAM Disk from WinGet"
Write-Host "  - Microsoft Edge from WinGet"
Write-Host "  - PowerBGInfo from PowerShell 7.x"
Write-Host "  - Microsoft Visual C++ 2008 Redistributable - x86 from WinGet"
Write-Host "  - Plex for Windows from WinGet"
Write-Host "  - Posh Git from PowerShell 7.x"
Write-Host "  - Hashtable from PowerShell 7.x"
Write-Host "  - ZLocation from PowerShell 7.x"
Write-Host "  - Python Magic from Pip"
Write-Host "  - Rivatuner Statistics Server from WinGet"
Write-Host "  - Malwarebytes Windows Firewall Control from WinGet"
Write-Host "  - simplewall from WinGet"
Write-Host "  - NVM for Windows from WinGet"
Write-Host "  - CasingStyle from PowerShell 7.x"
Write-Host "  - Error Lookup Tool from WinGet"
Write-Host "  - Catesta from PowerShell 7.x"
Write-Host "  - Terminal Icons from PowerShell 7.x"
Write-Host "  - Markdown from PowerShell 7.x"
Write-Host "  - Visual Studio Community 2022 from WinGet"
Write-Host "  - TreeSize Free from WinGet"
Write-Host "  - Open-Shell from WinGet"
Write-Host "  - GitHub Desktop from WinGet"
Write-Host "  - CapFrameX from WinGet"
Write-Host "  - Azure extension for Command Palette from WinGet"
Write-Host "  - Colors for Command Palette from WinGet"
Write-Host "  - Notepad++ from WinGet"
Write-Host "  - Process Monitor from WinGet"
Write-Host "  - Twinkle Tray from WinGet"
Write-Host "  - ElevenClock from WinGet"
Write-Host "  - Epic Games Launcher from WinGet"
Write-Host "  - FxSound from WinGet"
Write-Host "  - PsCommandDiscovery from PowerShell 7.x"
Write-Host "  - Plex Media Server from WinGet"
Write-Host "  - WinGet Essentials from PowerShell 7.x"
Write-Host "  - TweakPower from WinGet"
Write-Host "  - PyYAML from Pip"
Write-Host "  - Cemu from WinGet"
Write-Host "  - Microsoft.WinGet.. from PowerShell 7.x"
Write-Host "  - FFmpeg for yt-dlp from WinGet"
Write-Host "  - JoyToKey from WinGet"
Write-Host "  - UltraVNC from WinGet"
Write-Host "  - Windows Terminal Preview from WinGet"
Write-Host "  - Python Launcher from WinGet"
Write-Host "  - PawnIO from WinGet"
Write-Host "  - nu from WinGet"
Write-Host "  - Dropbox from WinGet"
Write-Host "  - TimeSpan from PowerShell 7.x"
Write-Host "  - Visual Studio Code from WinGet"
Write-Host "  - Click from Pip"
Write-Host "  - PSWinGlue from PowerShell 7.x"
Write-Host "  - EverythingCmdPal from WinGet"
Write-Host "  - Microsoft.PowerSh. from PowerShell 7.x"
Write-Host "  - Microsoft ASP.NET Core Runtime 8.0 from WinGet"
Write-Host "  - PSReadLine from PowerShell 7.x"
Write-Host "  - CPUID HWMonitor from WinGet"
Write-Host "  - Carbon from PowerShell 7.x"
Write-Host "  - Microsoft PowerToys from WinGet"
Write-Host "  - Intel® Driver & Support Assistant from WinGet"
Write-Host "  - Evergreen from PowerShell 7.x"
Write-Host "  - Quick CPU x64 from WinGet"
Write-Host "  - SuperF4 from WinGet"
Write-Host "  - Pulsar from WinGet"
Write-Host "  - CopyQ from WinGet"
Write-Host "  - Discord from WinGet"
Write-Host "  - Image Factory from PowerShell 7.x"
Write-Host "  - Git Extensions from WinGet"
Write-Host "  - MPC-HC from WinGet"
Write-Host "  - MSI Afterburner from WinGet"
Write-Host "  - Steam from WinGet"
Write-Host "  - SimplySql from PowerShell 7.x"
Write-Host "  - PowerShell from WinGet"
Write-Host "  - NVIDIA PhysX System Software from WinGet"
Write-Host "  - Samsung Magician from WinGet"
Write-Host "  - WebSearchShortcut from WinGet"
Write-Host "  - Microsoft .NET Windows Desktop Runtime 3.1 from WinGet"
Write-Host "  - Recent Files for Command Palette from WinGet"
Write-Host "  - Uri from PowerShell 7.x"
Write-Host "  - Flow Launcher from WinGet"
Write-Host "  - Context from PowerShell 7.x"
Write-Host "  - Posh SSH from PowerShell 7.x"
Write-Host "  - EverythingCmdPal from WinGet"
Write-Host "  - Autologon from PowerShell 7.x"
Write-Host "  - PSDeploy from PowerShell 7.x"
Write-Host "  - Spacedrive from WinGet"
Write-Host "  - GitHub from PowerShell 7.x"
Write-Host "  - Process Lasso from WinGet"
Write-Host "  - Sublime Merge from WinGet"
Write-Host "  - Everything from WinGet"
Write-Host "  - Windsurf from WinGet"
Write-Host "  - TableUI from PowerShell 7.x"
Write-Host "  - Battle.net from WinGet"
Write-Host "  - PSKoans from PowerShell 7.x"
Write-Host "  - GitHub extension for Command Palette from WinGet"
Write-Host "  - Microsoft.UI.Xaml from WinGet"
Write-Host "  - WindowsPSModulePa. from PowerShell 7.x"
Write-Host "  - WinScript from WinGet"
Write-Host "  - Sucrose Wallpaper Engine from WinGet"
Write-Host "  - NuGet from WinGet"
Write-Host "  - UniGetUI (formerly WingetUI) from WinGet"
Write-Host "  - Plaster from PowerShell 7.x"
Write-Host "  - Rainmeter from WinGet"
Write-Host "  - DesktopManager from PowerShell 7.x"
Write-Host "  - VirusTotalAnalyzer from PowerShell 7.x"
Write-Host "  - Fast Node Manager from WinGet"
Write-Host "  - Microsoft GameInput from WinGet"
Write-Host "  - CompactGUI from WinGet"
Write-Host "  - Microsoft .NET Windows Desktop Runtime 5.0 from WinGet"
Write-Host "  - BurntToast from PowerShell 7.x"
Write-Host "  - Microsoft Visual C++ 2010 x86 Redistributable from WinGet"
Write-Host "  - WizFile from WinGet"
Write-Host "  - TeraCopy from WinGet"
Write-Host "  - Bulk Crap Uninstaller from WinGet"
Write-Host "  - Microsoft.WinGet.. from PowerShell 7.x"
Write-Host "  - Z from PowerShell 7.x"
Write-Host "  - Microsoft.PowerSh. from PowerShell 7.x"
Write-Host "  - PSPGP from PowerShell 7.x"
Write-Host "  - Scoop from PowerShell 7.x"
Write-Host "  - CMake from WinGet"
Write-Host "  - QuickLook from WinGet"
Write-Host "  - App Installer from WinGet"
Write-Host "  - TCPView from WinGet"
Write-Host "  - Fonts from PowerShell 7.x"
Write-Host "  - PSCommander from PowerShell 7.x"
Write-Host "  - Fonts from PowerShell 7.x"
Write-Host "  - Microsoft Visual C++ 2013 Redistributable (x86) from WinGet"
Write-Host "  - Veeam Agent for Microsoft Windows from WinGet"
Write-Host "  - Dbatools.library from PowerShell 7.x"
Write-Host "  - fzf from WinGet"
Write-Host "  - DynamicParams from PowerShell 7.x"
Write-Host "  - VcRedist from PowerShell 7.x"
Write-Host "  - Utilities from PowerShell 7.x"
Write-Host "  - Cobalt from PowerShell 7.x"
Write-Host "  - Power Automate for desktop from WinGet"
Write-Host "  - String from PowerShell 7.x"
Write-Host "  - PSEventViewer from PowerShell 7.x"
Write-Host "  - Six from Pip"
Write-Host "  - Pip from Pip"
Write-Host "  - Lively Wallpaper from WinGet"
Write-Host "  - yt-dlp from WinGet"
Write-Host "  - Spec.base.utiliti. from PowerShell 7.x"
Write-Host "  - ShareX from WinGet"
Write-Host "  - Link Shell Extension from WinGet"
Write-Host "  - NerdFonts from PowerShell 7.x"
Write-Host "  - Autoruns from WinGet"
Write-Host "  - WinMerge from WinGet"
Write-Host "  - Display Driver Uninstaller from WinGet"
Write-Host "  - PSFramework from PowerShell 7.x"
Write-Host "  - Microsoft Teams from WinGet"
Write-Host "  - Total Commander from WinGet"
Write-Host "  - InvokeBuild from PowerShell 7.x"
Write-Host "  - Microsoft Visual C++ 2012 Redistributable (x86) from WinGet"
Write-Host "  - EFI Boot Editor from WinGet"
Write-Host "  - Sublime Text 4 from WinGet"
Write-Host "  - Everything Cli from WinGet"
Write-Host "  - FFmpeg from WinGet"
Write-Host "  - Docker Desktop from WinGet"
Write-Host "  - Pywin32 from Pip"
Write-Host "  - NanaZip Preview from WinGet"
Write-Host "  - Tqdm from Pip"
Write-Host "  - Microsoft OneDrive from WinGet"
Write-Host "  - BleachBit from WinGet"
Write-Host "  - 7-Zip from WinGet"
Write-Host "  - PSFzf from PowerShell 7.x"
Write-Host "  - Dev Numbers for Command Palette from WinGet"
Write-Host "  - InvokeBuild from PowerShell 7.x"
Write-Host "  - HWiNFO® from WinGet"
Write-Host "  - Microsoft Visual C++ 2015-2022 Redistributable (x64) from WinGet"
Write-Host "  - Microsoft .NET SDK 10.0 Preview from WinGet"
Write-Host "  - Microsoft.WinGet.. from PowerShell 7.x"
Write-Host "  - Sandboxie-Plus from WinGet"
Write-Host "  - Microsoft System CLR Types for SQL Server 2019 from WinGet"
Write-Host "  - PSDesiredStateCon. from PowerShell 7.x"
Write-Host "  - Microsoft .NET Windows Desktop Runtime 8.0 from WinGet"
Write-Host "  - InvokeBuild from PowerShell 7.x"
Write-Host "  - PSWriteColor from PowerShell 7.x"
Write-Host "  - Pester from PowerShell 7.x"
Write-Host "  - PoShLog from PowerShell 7.x"
Write-Host "  - Microsoft Visual C++ 2015 UWP Desktop Runtime Package from WinGet"
Write-Host "  - Python 3.13 from WinGet"
Write-Host "  - ImagePlayground from PowerShell 7.x"
Write-Host "  - Video Downloader for Command Palette from WinGet"
Write-Host "  - Npm Upgrade from PowerShell 7.x"
Write-Host "  - Node.js from WinGet"
Write-Host "  - Az.Tools.Predictor from PowerShell 7.x"
Write-Host "  - VLC from WinGet"
Write-Host "  - SyncTrayzor (x64) from WinGet"
Write-Host "  - TechPowerUp GPU-Z from WinGet"
Write-Host "  - xemu from WinGet"
Write-Host "  - Admin from PowerShell 7.x"
Write-Host "  - LocalSend from WinGet"
Write-Host "  - Ubisoft Connect - PC from WinGet"
Write-Host "  - NVCleanstall from WinGet"
Write-Host "  - Edge Favorites Extension for Command Palette from WinGet"
Write-Host "  - SteamPal for Command Palette from WinGet"
Write-Host "  - Microsoft .NET Windows Desktop Runtime 6.0 from WinGet"
Write-Host "  - Pester from PowerShell 7.x"
Write-Host "  - DISMTools from WinGet"
Write-Host "  - PSFramework from PowerShell 7.x"
Write-Host "  - AnyDesk from WinGet"
Write-Host "  - Psutil from Pip"
Write-Host "  - Microsoft.PowerSh. from PowerShell 7.x"
Write-Host "  - NanaZip from WinGet"
Write-Host "  - Visual Studio Extension for Command Palette from WinGet"
Write-Host "  - PSScriptAnalyzer from PowerShell 7.x"
Write-Host "  - Oh My Posh from PowerShell 7.x"
Write-Host "  - TranslucentTB from WinGet"
Write-Host "  - Microsoft Visual C++ 2013 Redistributable (x64) from WinGet"
Write-Host "  - SpaceSniffer from WinGet"
Write-Host "  - Microsoft Visual C++ 2015-2022 Redistributable (x86) from WinGet"
Write-Host "  - ModernFlyouts (Preview) from WinGet"
Write-Host "  - GitHub CLI from WinGet"
Write-Host "  - InvokeBuild from PowerShell 7.x"
Write-Host "  - OpenVPN Connect from WinGet"
Write-Host "  - PSReadLine from PowerShell 5.x"
Write-Host "  - Microsoft .NET Windows Desktop Runtime 7.0 from WinGet"
Write-Host "  - Media Controls for Command Palette from WinGet"
Write-Host "  - EA app from WinGet"
Write-Host "  - NVIDIA GeForce NOW from WinGet"
Write-Host "  - Microsoft Visual C++ 2008 Redistributable - x64 from WinGet"
Write-Host "  - PSDepend from PowerShell 7.x"
Write-Host "  - Foil from PowerShell 7.x"
Write-Host "  - Oh My Posh from WinGet"
Write-Host "  - Microsoft .NET Windows Desktop Runtime 9.0 from WinGet"
Write-Host "  - Hashtable from PowerShell 7.x"
Write-Host "  - Minecraft Launcher from WinGet"
Write-Host "  - PSWindowsUpdate from PowerShell 7.x"
Write-Host "  - Watchdog from Pip"
Write-Host "  - WizTree from WinGet"
Write-Host "  - Command Palette - VS Code from WinGet"
Write-Host "  - Ast from PowerShell 7.x"
Write-Host "  - Syncthing Tray from WinGet"
Write-Host "  - Pscx from PowerShell 7.x"
Write-Host "  - PSScriptMenuGui from PowerShell 7.x"
Write-Host "  - Dbatools from PowerShell 7.x"
Write-Host "  - Google Drive from WinGet"
Write-Host "  - GOG GALAXY from WinGet"
Write-Host "  - FanControl from WinGet"
Write-Host "  - Sodium from PowerShell 7.x"
Write-Host "  - SecurityPolicy from PowerShell 7.x"
Write-Host "  - WinPaletter from WinGet"
Write-Host "  - Wise Toys from WinGet"
Write-Host "  - Colorama from Pip"
Write-Host "  - TrustedSigning from PowerShell 7.x"
Write-Host "  - Ventoy from WinGet"
Write-Host "  - PSCustomObject from PowerShell 7.x"
Write-Host "  - CredentialManager from PowerShell 7.x"
Write-Host "  - Revo Uninstaller from WinGet"
Write-Host "  - Microsoft Visual C++ 2005 Redistributable from WinGet"
Write-Host "  - Windows Terminal from WinGet"
Write-Host "  - PSUtil from PowerShell 7.x"
Write-Host "  - PSP Inventory from PowerShell 7.x"
Write-Host "  - WinSoftwareUpdate from PowerShell 7.x"
Write-Host "  - TightVNC from WinGet"
Write-Host "  - zoxide from WinGet"
Write-Host "  - Dbatools from PowerShell 7.x"
Write-Host "  - Ubuntu from WinGet"
Write-Host "  - Windhawk from WinGet"
Write-Host "  - PlatyPS from PowerShell 7.x"
Write-Host "  - CapCut from WinGet"
Write-Host "  - Microsoft ODBC Driver 17 for SQL Server from WinGet"
Write-Host "  - Cursor from WinGet"
Write-Host "  - PowerShell Preview from WinGet"
Write-Host "  - Winget Install from PowerShell 7.x"
Write-Host "  - CPUID CPU-Z from WinGet"
Write-Host "  - Pester from PowerShell 5.x"
Write-Host "  - paint.net from WinGet"
Write-Host "  - Python Dateutil from Pip"
Write-Host "  - direnv from WinGet"
Write-Host "  - Context from PowerShell 7.x"
Write-Host "  - gsudo from WinGet"
Write-Host "  - TeamViewer from WinGet"
Write-Host "  - Emulationstation from WinGet"
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
Clear-Host

$success_count=0
$failure_count=0
$commands_run=0
$results=""

$commands= @(
    'cmd.exe /C winget.exe install --id "GlennDelahoy.SnappyDriverInstallerOrigin" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JesseDuffield.lazygit" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PowerShellForGitH. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Logging -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "FilesCommunity.Files" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "15722UsefulApp.WorkspaceLauncherForVSCode" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Admin -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name LocalAccounts -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Git.Git" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name 7Zip4Powershell -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Oracle.VirtualBox" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Duplicati.Duplicati" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Posh-SYSLOG -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name TextTable -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Admin -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Neovim.Neovim" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "SoftPerfect.RAMDisk" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.Edge" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PowerBGInfo -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2008.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XP9CDQW6ML4NQN" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name posh-git -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Hashtable -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name ZLocation -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pip install python-magic --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "Guru3D.RTSS" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "BiniSoft.WindowsFirewallControl" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Henry++.simplewall" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "CoreyButler.NVMforWindows" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name CasingStyle -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.err" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Catesta -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Terminal-Icons -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Markdown -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.VisualStudio.2022.Community" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XP9M26RSCLNT88" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Open-Shell.Open-Shell-Menu" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "GitHub.GitHubDesktop" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "CXWorld.CapFrameX" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.CmdPalAzureExtension" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JiriPolasek.ColorsforCommandPalette" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Notepad++.Notepad++" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.Sysinternals.ProcessMonitor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "xanderfrangos.twinkletray" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XP89HZ8SVWTT0M" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "EpicGames.EpicGamesLauncher" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "FxSound.FxSound" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PsCommandDiscovery -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Plex.PlexMediaServer" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name WinGet-Essentials -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "KurtZimmermann.TweakPower" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install PyYAML --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "Cemu.Cemu" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Microsoft.WinGet.. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "yt-dlp.FFmpeg" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JTKsoftware.JoyToKey" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "uvncbvba.UltraVNC" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsTerminal.Preview" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Python.Launcher" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "namazso.PawnIO" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Nushell.Nushell" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Dropbox.Dropbox" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name TimeSpan -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "XP9KHM4BK9FZ7Q" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install click --no-input --no-color --no-cache',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSWinGlue -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "lin-ycv.EverythingCmdPal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Microsoft.PowerSh. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.AspNetCore.8" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSReadLine -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "CPUID.HWMonitor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Carbon -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "XP89DCGQ3K6VLD" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Intel.IntelDriverAndSupportAssistant" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Evergreen -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "CoderBag.QuickCPUx64" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "StefanSundin.Superf4" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Pulsar-Edit.Pulsar" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "hluk.CopyQ" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XPDC2RH70K22MN" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Image-Factory -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "GitExtensionsTeam.GitExtensions" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "clsid2.mpc-hc" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Guru3D.Afterburner" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Valve.Steam" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name SimplySql -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.PowerShell" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Nvidia.PhysX" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XPDDT99J9GKB5C" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Riri.WebSearchShortcut" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.3_1" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JiriPolasek.RecentFilesforCommandPalette" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Uri -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Flow-Launcher.Flow-Launcher" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Context -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Posh-SSH -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "lin-ycv.EverythingCmdPal3" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Autologon -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSDeploy -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "spacedrive.Spacedrive" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name GitHub -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "BitSum.ProcessLasso" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "SublimeHQ.SublimeMerge" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "voidtools.Everything" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Codeium.Windsurf" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name TableUI -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "XPDM5VSMTKQLBJ" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSKoans -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.CmdPalGitHubExtension" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.UI.Xaml.2.8" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name WindowsPSModulePa. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "flick9000.WinScript" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Taiizor.SucroseWallpaperEngine" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.NuGet" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "MartiCliment.UniGetUI" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Plaster -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Rainmeter.Rainmeter" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name DesktopManager -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name VirusTotalAnalyzer -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Schniz.fnm" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.GameInput" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "IridiumIO.CompactGUI" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.5" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name BurntToast -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2010.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "AntibodySoftware.WizFile" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "CodeSector.TeraCopy" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Klocman.BulkCrapUninstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Microsoft.WinGet.. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name z -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Microsoft.PowerSh. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSPGP -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Scoop -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Kitware.CMake" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "QL-Win.QuickLook" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.AppInstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.Sysinternals.TCPView" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Fonts -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSCommander -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Fonts -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2013.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Veeam.VeeamAgent" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name dbatools.library -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "junegunn.fzf" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name DynamicParams -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name VcRedist -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Utilities -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Cobalt -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.PowerAutomateDesktop" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name string -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSEventViewer -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pip install six --no-input --no-color --no-cache',
    'cmd.exe /C pip install pip --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "rocksdanister.LivelyWallpaper" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "yt-dlp.yt-dlp" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name spec.base.utiliti. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "ShareX.ShareX" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "HermannSchinagl.LinkShellExtension" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name NerdFonts -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.Sysinternals.Autoruns" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "WinMerge.WinMerge" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Wagnardsoft.DisplayDriverUninstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSFramework -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.Teams" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Ghisler.TotalCommander" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name InvokeBuild -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2012.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "EFIBootEditor.EFIBootEditor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "SublimeHQ.SublimeText.4" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "voidtools.Everything.Cli" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Gyan.FFmpeg" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Docker.DockerDesktop" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install pywin32 --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "M2Team.NanaZip.Preview" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install tqdm --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "Microsoft.OneDrive" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "BleachBit.BleachBit" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "7zip.7zip" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSFzf -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "JiriPolasek.DevNumbersforCommandPalette" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name InvokeBuild -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "REALiX.HWiNFO" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2015+.x64" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.SDK.Preview" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Microsoft.WinGet.. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Sandboxie.Plus" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.CLRTypesSQLServer.2019" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSDesiredStateCon. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.8" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name InvokeBuild -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSWriteColor -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Pester -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PoShLog -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.VCLibs.Desktop.14" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Python.Python.3.13" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name ImagePlayground -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "DevLG.CmdPalVideoDownloader" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name npm-upgrade -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "OpenJS.NodeJS" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Az.Tools.Predictor -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "XPDM1ZW6815MQM" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "GermanCoding.SyncTrayzor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "TechPowerUp.GPU-Z" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "xemu-project.xemu" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Admin -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "LocalSend.LocalSend" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "XPDP2QW12DFSFK" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "TechPowerUp.NVCleanstall" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "davidegiacometti.EdgeFavoritesForCmdPal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "StontyTech.SteamPalforCommandPalette" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.6" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Pester -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "CodingWondersSoftware.DISMTools.Stable" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSFramework -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "AnyDesk.AnyDesk" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install psutil --no-input --no-color --no-cache',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Microsoft.PowerSh. -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "M2Team.NanaZip" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "davidegiacometti.VisualStudioForCmdPal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSScriptAnalyzer -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name oh-my-posh -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "CharlesMilette.TranslucentTB" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2013.x64" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "UderzoSoftware.SpaceSniffer" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2015+.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ModernFlyouts.ModernFlyouts" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "GitHub.cli" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name InvokeBuild -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "OpenVPNTechnologies.OpenVPNConnect" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C powershell.exe Install-Module -Name PSReadLine -Confirm:$false -Force -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.7" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JiriPolasek.MediaControlsforCommandPalette" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ElectronicArts.EADesktop" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Nvidia.GeForceNow" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2008.x64" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSDepend -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Foil -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "JanDeDobbeleer.OhMyPosh" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.DotNet.DesktopRuntime.9" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Hashtable -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Mojang.MinecraftLauncher" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSWindowsUpdate -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pip install watchdog --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "AntibodySoftware.WizTree" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "JonahFintzDEV.CommandPalette-VSCode" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Ast -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Martchus.syncthingtray" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Pscx -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSScriptMenuGui -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name dbatools -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Google.GoogleDrive" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "GOG.Galaxy" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Rem0o.FanControl" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Sodium -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name SecurityPolicy -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Abdelrhman-AK.WinPaletter" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "WiseCleaner.WiseToys" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install colorama --no-input --no-color --no-cache',
    'cmd.exe /C pwsh.exe Install-PSResource -Name TrustedSigning -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Ventoy.Ventoy" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSCustomObject -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name CredentialManager -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "RevoUninstaller.RevoUninstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.VCRedist.2005.x86" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsTerminal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSUtil -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name PSP-Inventory -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C pwsh.exe Install-PSResource -Name WinSoftwareUpdate -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "GlavSoft.TightVNC" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "ajeetdsouza.zoxide" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name dbatools -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "Canonical.Ubuntu" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "RamenSoftware.Windhawk" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name platyPS -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "XP9KN75RRB9NHS" --exact --source msstore --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.msodbcsql.17" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Anysphere.Cursor" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.PowerShell.Preview" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name winget-install -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "CPUID.CPU-Z" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C powershell.exe Install-Module -Name Pester -Confirm:$false -Force -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "dotPDN.PaintDotNet" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install python-dateutil --no-input --no-color --no-cache',
    'cmd.exe /C winget.exe install --id "direnv.direnv" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pwsh.exe Install-PSResource -Name Context -Confirm:$false -TrustRepository -AcceptLicense -Scope CurrentUser',
    'cmd.exe /C winget.exe install --id "gerardog.gsudo" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "TeamViewer.TeamViewer" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Emulationstation.Emulationstation" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force'
)

foreach ($command in $commands) {
    Write-Host "Running: $command" -ForegroundColor Yellow
    cmd.exe /C $command
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[  OK  ] $command" -ForegroundColor Green
        $success_count++
        $results += "$([char]0x1b)[32m[  OK  ] $command`n"
    }
    else {
        Write-Host "[ FAIL ] $command" -ForegroundColor Red
        $failure_count++
        $results += "$([char]0x1b)[31m[ FAIL ] $command`n"
    }
    $commands_run++
    Write-Host ""
}

Write-Host "========================================================"
Write-Host "                  OPERATION SUMMARY"
Write-Host "========================================================"
Write-Host "Total commands run: $commands_run"
Write-Host "Successful: $success_count"
Write-Host "Failed: $failure_count"
Write-Host ""
Write-Host "Details:"
Write-Host "$results$([char]0x1b)[37m"
Write-Host "========================================================"

if ($failure_count -gt 0) {
    Write-Host "Some commands failed. Please check the log above." -ForegroundColor Yellow
}
else {
    Write-Host "All commands executed successfully!" -ForegroundColor Green
}
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
exit $failure_count