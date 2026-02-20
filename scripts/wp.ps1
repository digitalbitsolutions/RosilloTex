param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$Args
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not (Test-Path "docker/.env")) {
  throw "No existe docker/.env. Ejecuta primero .\\scripts\\dev-up.ps1"
}

if (-not $Args -or $Args.Count -eq 0) {
  throw "Debes pasar argumentos de WP-CLI. Ej: .\\scripts\\wp.ps1 plugin list"
}

docker compose --env-file docker/.env run --rm --no-deps wpcli @Args --allow-root --path=/var/www/html
if ($LASTEXITCODE -ne 0) {
  throw "Comando WP-CLI fallo."
}
