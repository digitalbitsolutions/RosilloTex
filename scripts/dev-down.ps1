param(
  [switch]$Volumes
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$envFile = "docker/.env"
if (-not (Test-Path $envFile)) {
  $envFile = "docker/.env.example"
  Write-Host "No existe docker/.env. Se usara docker/.env.example para ejecutar down."
}

$args = @("compose", "--env-file", $envFile, "down")

if ($Volumes) {
  $args += "-v"
}

docker @args
if ($LASTEXITCODE -ne 0) {
  throw "docker compose down fallo."
}
