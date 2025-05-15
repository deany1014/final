# Define app name and paths
$appName = "main"
$installDir = "$env:APPDATA\$appName"
$exePath = "$installDir\$appName.exe"
$startupShortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\$appName.lnk"

# Kill the running process if it exists
$proc = Get-Process -Name $appName -ErrorAction SilentlyContinue
if ($proc) {
    Stop-Process -Name $appName -Force
    Write-Host "⛔ Killed running process: $appName.exe"
}

# Remove startup shortcut
if (Test-Path $startupShortcut) {
    Remove-Item $startupShortcut -Force
    Write-Host "🗑️ Removed startup shortcut."
}

# Remove EXE
if (Test-Path $exePath) {
    Remove-Item $exePath -Force
    Write-Host "🗑️ Removed application executable."
}

# Remove folder if empty
if ((Test-Path $installDir) -and ((Get-ChildItem $installDir).Count -eq 0)) {
    Remove-Item $installDir -Force
    Write-Host "🗑️ Removed empty app folder."
}

Write-Host "`n✅ $appName successfully uninstalled." -ForegroundColor Green
