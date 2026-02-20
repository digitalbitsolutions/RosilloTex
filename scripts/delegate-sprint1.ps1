param(
  [Parameter(Mandatory = $false)]
  [string]$WebhookUrl = ""
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$agentCommand = "agent run --cwd d:\Meeguel\rosillotex --prompt-file docs/JOB-Sprint1.md --no-questions"

& ".\scripts\delegate-job.ps1" -AgentCommand $agentCommand -JobFile "docs/JOB-Sprint1.md" -WebhookUrl $WebhookUrl
