# Settings
$appName = "main"
$installDir = "$env:APPDATA\$appName"
$exePath = "$installDir\$appName.exe"
$startupShortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\$appName.lnk"

# Remove Startup Shortcut
if (Test-Path $startupShortcut) {
    Remove-Item $startupShortcut -Force
    Write-Host "🗑️ Removed startup shortcut."
}

# Remove EXE
if (Test-Path $exePath) {
    Remove-Item $exePath -Force
    Write-Host "🗑️ Removed application executable."
}

# Remove Folder (if empty)
if (Test-Path $installDir -and (Get-ChildItem $installDir).Count -eq 0) {
    Remove-Item $installDir -Force
    Write-Host "🗑️ Removed empty app folder."
}

Write-Host "`n✅ $appName successfully uninstalled." -ForegroundColor Green
