# AI Companion Autonomous Wake-Up System - Windows Installer
#
# Usage: .\install.ps1 [-Mode Productivity|Companion]
#
# Options:
#   -Mode Productivity  Install with productivity-focused protocol (default)
#   -Mode Companion     Install with companion-focused protocol

param (
    [string]$Mode = "Productivity"
)

$ErrorActionPreference = "Stop"
$ScriptDir = $PSScriptRoot

# === COLORS ===
function Write-Header { param([string]$Msg) Write-Host "`n=== $Msg ===" -ForegroundColor Cyan }
function Write-Success { param([string]$Msg) Write-Host "✔ $Msg" -ForegroundColor Green }
function Write-Warning { param([string]$Msg) Write-Host "⚠ $Msg" -ForegroundColor Yellow }
function Write-ErrorMsg { param([string]$Msg) Write-Host "✘ $Msg" -ForegroundColor Red }

function Safe-Copy-Item {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Name
    )

    if (Test-Path $Destination) {
        # Compare hashes
        $SrcHash = (Get-FileHash $Source).Hash
        $DestHash = (Get-FileHash $Destination).Hash

        if ($SrcHash -eq $DestHash) {
            Write-Success "$Name is up to date."
        } else {
            $Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
            $Backup = "$Destination.backup-$Timestamp"
            Copy-Item $Destination $Backup -Force
            Copy-Item $Source $Destination -Force
            Write-Warning "Updated $Name (backup created at $Backup)"
        }
    } else {
        Copy-Item $Source $Destination -Force
        Write-Success "Installed $Name"
    }
}

Write-Header "AI Companion Autonomous Wake-Up System (Windows)"

# === CHECK CLAUDE ===
Write-Host "Checking for Claude Code..."
$ClaudeCmd = "claude.cmd" # Windows usually installs as .cmd
if (Get-Command $ClaudeCmd -ErrorAction SilentlyContinue) {
    Write-Success "Claude Code found."
} else {
    Write-ErrorMsg "Claude Code not found in PATH."
    Write-Host "Please install via: npm install -g @anthropic-ai/claude-code"
    
    $Response = Read-Host "Continue anyway? (y/n)"
    if ($Response -ne "y") { exit 1 }
}

# === SETUP DIRECTORIES ===
$DocPath = [Environment]::GetFolderPath("MyDocuments")
$InstallPath = Join-Path $DocPath "AI-Companion"

Write-Header "Setting up directories at $InstallPath..."

if (-not (Test-Path $InstallPath)) {
    New-Item -ItemType Directory -Force -Path $InstallPath | Out-Null
    Write-Success "Created main directory"
}

$Dirs = @("journal", "tasks\pending", "tasks\completed", "tasks\awaiting-input", "tasks\blocked", "tasks\archive", "context", "logs", "scripts", "protocols")
foreach ($dir in $Dirs) {
    $FullPath = Join-Path $InstallPath $dir
    if (-not (Test-Path $FullPath)) {
        New-Item -ItemType Directory -Force -Path $FullPath | Out-Null
        Write-Success "Created $dir"
    }
}

# === SETUP SANDBOX ===
Write-Header "Configuring Security Sandbox..."
$SettingsDir = Join-Path $InstallPath ".claude"
if (-not (Test-Path $SettingsDir)) { New-Item -ItemType Directory -Force -Path $SettingsDir | Out-Null }

$SettingsFile = Join-Path $SettingsDir "settings.local.json"
if (-not (Test-Path $SettingsFile)) {
    # Escape backslashes for JSON
    $JsonPath = $InstallPath -replace "\\", "\\"
    
    $SettingsContent = @"
{
  "permissions": {
    "allow": [
      "Read($JsonPath\\**)",
      "Edit($JsonPath\\**)",
      "Write($JsonPath\\**)",
      "Glob($JsonPath\\**)",
      "WebSearch"
    ],
    "deny": []
  }
}
"@
    $SettingsContent | Set-Content $SettingsFile
    Write-Success "Created security sandbox: $SettingsFile"
} else {
    Write-Success "Security sandbox already exists."
}

# === COPY FILES ===
Write-Header "Installing files..."

# Copy Scripts
Safe-Copy-Item (Join-Path $ScriptDir "wakeup.ps1") (Join-Path $InstallPath "wakeup.ps1") "Wake-Up Script"
Safe-Copy-Item (Join-Path $ScriptDir "sam.ps1") (Join-Path $InstallPath "scripts\sam.ps1") "SAM CLI"
Safe-Copy-Item (Join-Path $ScriptDir "sam.bat") (Join-Path $InstallPath "scripts\sam.bat") "SAM Batch"

# Copy Protocols
Copy-Item (Join-Path $ScriptDir "protocols\*.md") -Destination (Join-Path $InstallPath "protocols") -Force
Write-Success "Protocol templates installed"

# Setup Active Protocol
$TargetProtocol = Join-Path $InstallPath "autonomous-wakeup.md"
# Setup Active Protocol
$TargetProtocol = Join-Path $InstallPath "autonomous-wakeup.md"
if ($Mode -eq "Productivity") {
    Safe-Copy-Item (Join-Path $ScriptDir "protocols\productivity-agent.md") $TargetProtocol "Active Protocol (Productivity)"
} else {
    Safe-Copy-Item (Join-Path $ScriptDir "protocols\autonomous-wakeup.md") $TargetProtocol "Active Protocol (Companion)"
}

# === SCHEDULED TASK ===
Write-Header "Configuring Scheduled Task..."

$TaskName = "AICompanionWakeup"
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$InstallPath\wakeup.ps1`""
$Trigger = New-ScheduledTaskTrigger -Daily -At "9:00am" 
# Note: Complex repetition triggers are harder in pure PS one-liners, stick to simple daily or use the loop method from original setup if needed.
# For now, let's create a robust daily trigger that repeats every hour for 12 hours.
$Trigger.RepetitionInterval = (New-TimeSpan -Hours 1)
$Trigger.RepetitionDuration = (New-TimeSpan -Hours 12)

$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue

try {
    Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -Description "AI Companion Autonomous Wake-Up" | Out-Null
    Write-Success "Scheduled Task '$TaskName' created."
} catch {
    Write-Warning "Failed to create scheduled task. You may need to run this script as Administrator."
    Write-Host "Error: $_"
}

# === FINALINSTRUCTIONS ===
Write-Header "Installation Complete!"
Write-Host "1. Add this to your PATH to use the 'sam' command:"
Write-Host "   $InstallPath\scripts" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Test the system:"
Write-Host "   sam wake"
Write-Host ""
