param(
  [switch]$SkipDocker,
  [switch]$InitAstro
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

& ".\scripts\preflight.ps1"

if (-not $SkipDocker) {
  & ".\scripts\dev-up.ps1"
}

if ($InitAstro -and -not (Test-Path "apps/web")) {
  Write-Host ""
  Write-Host "Inicializando Astro en apps/web..."
  npm create astro@latest apps/web -- --template basics --typescript strict --install --git false
  if ($LASTEXITCODE -ne 0) {
    throw "Fallo al inicializar Astro."
  }
}

if (-not $SkipDocker) {
  $wpPort = ((Get-Content "docker/.env" | Where-Object { $_ -match "^WP_PORT=" } | Select-Object -First 1) -split "=", 2)[1]
  $wpUrl = "http://localhost:$wpPort"
  try {
    $response = Invoke-WebRequest -Uri $wpUrl -UseBasicParsing -TimeoutSec 20
    if ($response.StatusCode -ne 200) {
      throw "Estado HTTP inesperado: $($response.StatusCode)"
    }
  }
  catch {
    throw "WordPress no responde correctamente en $wpUrl"
  }
}

Write-Host ""
Write-Host "Sesion lista para trabajar."
Write-Host "Siguiente paso recomendado:"
Write-Host "1) Abrir WordPress admin y verificar contenido base."
Write-Host "2) Iniciar frontend: cd apps/web ; npm run dev"
