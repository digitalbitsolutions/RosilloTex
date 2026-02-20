param(
  [Parameter(Mandatory = $false)]
  [string]$WebhookUrl = "",
  [Parameter(Mandatory = $false)]
  [string]$AgentExecutable = "agent"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$agentCommand = "$AgentExecutable run --cwd d:\Meeguel\rosillotex --prompt-file docs/JOB-Sprint1.md --no-questions"

& ".\scripts\delegate-job.ps1" -AgentCommand $agentCommand -JobFile "docs/JOB-Sprint1.md" -WebhookUrl $WebhookUrl
