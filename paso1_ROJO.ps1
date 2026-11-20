# PASO 1 - ROJO: crea el proyecto, copia SOLO las pruebas y ejecútalas (deben FALLAR)
# Uso: abre PowerShell en la carpeta donde descomprimiste el zip y ejecuta:  .\paso1_ROJO.ps1
$origen = $PSScriptRoot
Set-Location (Split-Path $origen -Parent)
flutter create super_dolores_app
Set-Location super_dolores_app
Copy-Item "$origen\pubspec.yaml" . -Force
Remove-Item test\widget_test.dart -ErrorAction SilentlyContinue
Copy-Item "$origen\test\*.dart" test\ -Force
flutter pub get
Write-Host "`n===== ROJO: las pruebas fallan porque todavia no existe el codigo =====`n" -ForegroundColor Red
flutter test test\dominio_test.dart
