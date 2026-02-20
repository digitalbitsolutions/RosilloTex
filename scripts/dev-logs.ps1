param(
  [string]$Service = ""
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$envFile = "docker/.env"
if (-not (Test-Path $envFile)) {
  $envFile = "docker/.env.example"
  Write-Host "No existe docker/.env. Se usara docker/.env.example para ver logs."
}

$args = @("compose", "--env-file", $envFile, "logs", "-f")

if ($Service -ne "") {
  $args += $Service
}

docker @args
if ($LASTEXITCODE -ne 0) {
  throw "docker compose logs fallo."
}
