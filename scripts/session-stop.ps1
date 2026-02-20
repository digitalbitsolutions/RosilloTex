param(
  [switch]$PurgeVolumes
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if ($PurgeVolumes) {
  & ".\scripts\dev-down.ps1" -Volumes
}
else {
  & ".\scripts\dev-down.ps1"
}

Write-Host "Sesion local detenida."
