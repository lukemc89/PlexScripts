# Define parameters
param (
    [string]$TaskName = "PlexReanalysis",
    [string]$ScriptPath = "C:\Scripts\ReanalyzePlex.ps1"
)

# Check if the task already exists
$existingTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($existingTask -ne $null) {
    Write-Output "Scheduled task '$TaskName' already exists."
    exit
}

# Check if the script file exists
if (-not (Test-Path $ScriptPath)) {
    Write-Error "Script file '$ScriptPath' does not exist."
    exit
}

# Action settings
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File $ScriptPath"

# Trigger settings
$trigger = New-ScheduledTaskTrigger -Daily -At 2am

# Register the task
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $TaskName -User "NT AUTHORITY\SYSTEM" -RunLevel Highest

# Check if the task was created successfully
$taskExists = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($taskExists -ne $null) {
    Write-Output "Scheduled task '$TaskName' has been created successfully."
} else {
    Write-Error "Failed to create scheduled task '$TaskName'."
}
