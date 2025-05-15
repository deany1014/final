# Define download URL
$exeUrl = "https://github.com/yourusername/yourrepo/releases/download/v1.0.0/yourapp.exe"
$installDir = "$env:APPDATA\MyApp"
$exePath = "$installDir\yourapp.exe"

# Create folder
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# Download .exe
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath

# Add to Startup
$startupShortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\yourapp.lnk"

$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($startupShortcut)
$shortcut.TargetPath = $exePath
$shortcut.Save()

Write-Host "Installed and added to startup!" -ForegroundColor Green
