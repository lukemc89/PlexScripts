param (
    [string]$plexPath = "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Scanner.exe",
    [string]$logDirectory = "C:\plex",
    [string]$logFileName = "plex_analysis.log",
    [int]$maxRetries = 3,
    [int]$retryDelay = 10
)

$logFile = Join-Path $logDirectory $logFileName

function LogMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $Message" | Out-File $logFile -Append

    # Log rotation (if log exceeds 10MB)
    if ((Get-Item $logFile).length -gt 10MB) {
        Rename-Item $logFile -NewName "$logFile.old"
    }
}

# Ensure log directory exists
if (-not (Test-Path $logDirectory)) {
    New-Item -Path $logDirectory -ItemType Directory
    LogMessage "Created log directory at $logDirectory"
}

# Check if Plex Media Scanner exists
if (-not (Test-Path $plexPath)) {
    LogMessage "Error: Plex Media Scanner not found at $plexPath"
    exit
}

# Fetch all libraries
$librariesRaw = & $plexPath --list
$libraries = $librariesRaw -split "`n" | Where-Object { $_ -match "^\s*(\d+)" } | ForEach-Object { $matches[1] }

foreach ($library in $libraries) {
    $retryCount = 0
    $success = $false

    while (-not $success -and $retryCount -lt $maxRetries) {
        LogMessage "Starting analysis for library $library..."

        try {
            & $plexPath --analyze -c $library 2>&1 | Out-File $logFile -Append
            LogMessage "Completed analysis for library $library."
            $success = $true
        } catch {
            LogMessage "Error encountered while analyzing library $library $_"
            $retryCount++
            Start-Sleep -Seconds $retryDelay
        }
    }

    if (-not $success) {
        LogMessage "Failed to analyze library $library after $maxRetries attempts."
    }
}

LogMessage "Script execution completed."
