param(
  [switch]$Quiet
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

function Get-EnvValue {
  param(
    [string]$Path,
    [string]$Key,
    [string]$DefaultValue
  )

  if (-not (Test-Path $Path)) {
    return $DefaultValue
  }

  $line = Get-Content $Path | Where-Object { $_ -match "^\s*$Key=" } | Select-Object -First 1
  if ($line) {
    return (($line -split "=", 2)[1]).Trim()
  }

  return $DefaultValue
}

function Write-Info {
  param([string]$Text)
  if (-not $Quiet) {
    Write-Host $Text
  }
}

foreach ($cmd in @("git", "docker", "node", "npm")) {
  if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
    throw "Falta comando requerido en PATH: $cmd"
  }
}

try {
  docker info | Out-Null
}
catch {
  throw "Docker Desktop no responde. Abre Docker Desktop e intenta de nuevo."
}

if (-not (Test-Path "docker/.env")) {
  Copy-Item "docker/.env.example" "docker/.env"
  Write-Info "Se creo docker/.env desde docker/.env.example."
}

$wpPort = [int](Get-EnvValue -Path "docker/.env" -Key "WP_PORT" -DefaultValue "18080")
$pmaPort = [int](Get-EnvValue -Path "docker/.env" -Key "PMA_PORT" -DefaultValue "18081")
$mailpitPort = [int](Get-EnvValue -Path "docker/.env" -Key "MAILPIT_UI_PORT" -DefaultValue "8025")

$running = docker compose --env-file docker/.env ps --status running --services 2>$null
if ($LASTEXITCODE -ne 0) {
  throw "No se pudo consultar estado de docker compose."
}

if (-not $running) {
  $running = @()
}

$busyPorts = @()
foreach ($port in @($wpPort, $pmaPort, $mailpitPort)) {
  $listeners = Get-NetTCPConnection -State Listen -LocalPort $port -ErrorAction SilentlyContinue
  if ($listeners) {
    $busyPorts += $port
  }
}

if ($busyPorts.Count -gt 0) {
  if ($running.Count -gt 0) {
    Write-Info "Info: puertos en uso (normal con servicios activos): $($busyPorts -join ', ')"
  }
  else {
    Write-Info "Advertencia: puertos en escucha detectados: $($busyPorts -join ', ')"
    Write-Info "Si no son procesos esperados, cambia puertos en docker/.env."
  }
}

Write-Info ""
Write-Info "Preflight OK"
Write-Info "- Node: $(node --version)"
Write-Info "- npm: $(npm --version)"
Write-Info "- Docker: disponible"
if ($running.Count -gt 0) {
  Write-Info "- Servicios activos: $($running -join ', ')"
}
else {
  Write-Info "- Servicios activos: ninguno"
}
Write-Info "- WordPress: http://localhost:$wpPort"
Write-Info "- phpMyAdmin: http://localhost:$pmaPort"
Write-Info "- Mailpit: http://localhost:$mailpitPort"
