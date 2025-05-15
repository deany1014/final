# Define paths
$installDir = "$env:APPDATA\MyApp"
$exePath = Join-Path $installDir "yourapp.exe"
$startupShortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\YourApp.lnk"

# Remove the shortcut
if (Test-Path $startupShortcut) {
    Remove-Item $startupShortcut -Force
    Write-Host "Removed startup shortcut." -ForegroundColor Yellow
} else {
    Write-Host "Startup shortcut not found." -ForegroundColor DarkGray
}

# Remove the executable
if (Test-Path $exePath) {
    Remove-Item $exePath -Force
    Write-Host "Removed application executable." -ForegroundColor Yellow
} else {
    Write-Host "Application executable not found." -ForegroundColor DarkGray
}

# Optional: Remove the whole app folder if empty
if ((Test-Path $installDir) -and ((Get-ChildItem $installDir).Count -eq 0)) {
    Remove-Item $installDir -Force
    Write-Host "Removed empty app folder." -ForegroundColor Yellow
}

Write-Host "`n✅ Uninstallation complete." -ForegroundColor Green
