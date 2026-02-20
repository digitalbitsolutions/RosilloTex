param(
  [Parameter(Mandatory = $true)]
  [string]$AgentCommand,
  [Parameter(Mandatory = $false)]
  [string]$JobFile = "docs/JOB.md",
  [Parameter(Mandatory = $false)]
  [string]$WebhookUrl = "",
  [Parameter(Mandatory = $false)]
  [string]$LogFile = "reports/job-run.log",
  [Parameter(Mandatory = $false)]
  [switch]$SkipCommandCheck
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if (-not (Test-Path $JobFile)) {
  throw "No existe el archivo de job: $JobFile"
}

if (-not (Test-Path "reports")) {
  New-Item -ItemType Directory -Path "reports" | Out-Null
}

$status = "SUCCESS"
$startedAt = Get-Date
$message = ""

try {
  if (-not $SkipCommandCheck) {
    $trimmed = $AgentCommand.Trim()
    $firstToken = ""
    if ($trimmed.StartsWith('"')) {
      $firstToken = ($trimmed -split '"')[1]
    }
    else {
      $firstToken = ($trimmed -split "\s+")[0]
    }

    if ($firstToken -and -not (Get-Command $firstToken -ErrorAction SilentlyContinue)) {
      throw "No se encontro el ejecutable del agente: $firstToken. Ajusta -AgentCommand."
    }
  }

  "[$(Get-Date -Format s)] Starting delegated job using: $JobFile" | Tee-Object -FilePath $LogFile -Append
  "[$(Get-Date -Format s)] Agent command: $AgentCommand" | Tee-Object -FilePath $LogFile -Append

  # Run command through cmd for broad compatibility with quoted arguments.
  cmd /c $AgentCommand 2>&1 | Tee-Object -FilePath $LogFile -Append

  if ($LASTEXITCODE -ne 0) {
    $status = "FAIL"
    $message = "Agent command returned non-zero exit code: $LASTEXITCODE"
  }
}
catch {
  $status = "FAIL"
  $message = $_.Exception.Message
  "[$(Get-Date -Format s)] Error: $message" | Tee-Object -FilePath $LogFile -Append
}
finally {
  $endedAt = Get-Date
  $duration = New-TimeSpan -Start $startedAt -End $endedAt
  $summary = @(
    "STATUS: $status",
    "STARTED_AT: $($startedAt.ToString("s"))",
    "ENDED_AT: $($endedAt.ToString("s"))",
    "DURATION: $($duration.ToString())"
  )

  if ($message -ne "") {
    $summary += "MESSAGE: $message"
  }

  $summaryText = $summary -join "`n"
  $summaryText | Tee-Object -FilePath "reports/final-report.md"

  if ($WebhookUrl -ne "") {
    try {
      $payload = @{
        text = "RosilloTex delegated job finished: $status`n$summaryText"
      } | ConvertTo-Json -Depth 3

      Invoke-RestMethod -Method Post -Uri $WebhookUrl -ContentType "application/json" -Body $payload | Out-Null
      "[$(Get-Date -Format s)] Webhook sent." | Tee-Object -FilePath $LogFile -Append
    }
    catch {
      "[$(Get-Date -Format s)] Webhook error: $($_.Exception.Message)" | Tee-Object -FilePath $LogFile -Append
    }
  }
}
