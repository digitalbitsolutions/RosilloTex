$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

function Get-EnvValue {
  param(
    [string]$Path,
    [string]$Key,
    [string]$DefaultValue
  )

  $line = Get-Content $Path | Where-Object { $_ -match "^\s*$Key=" } | Select-Object -First 1
  if ($line) {
    return (($line -split "=", 2)[1]).Trim()
  }

  return $DefaultValue
}

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
  throw "Docker no esta instalado o no esta en PATH."
}

if (-not (Test-Path "docker/.env")) {
  Copy-Item "docker/.env.example" "docker/.env"
  Write-Host "Se creo docker/.env desde docker/.env.example. Ajusta passwords si es necesario."
}

docker compose --env-file docker/.env up -d
if ($LASTEXITCODE -ne 0) {
  throw "docker compose up fallo. Revisa puertos en uso y logs."
}

$wpPort = Get-EnvValue -Path "docker/.env" -Key "WP_PORT" -DefaultValue "18080"
$pmaPort = Get-EnvValue -Path "docker/.env" -Key "PMA_PORT" -DefaultValue "18081"
$mailpitPort = Get-EnvValue -Path "docker/.env" -Key "MAILPIT_UI_PORT" -DefaultValue "8025"

Write-Host ""
Write-Host "Servicios levantados:"
Write-Host "- WordPress:  http://localhost:$wpPort"
Write-Host "- phpMyAdmin: http://localhost:$pmaPort"
Write-Host "- Mailpit:    http://localhost:$mailpitPort"
