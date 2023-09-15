 # Plex Reanalysis Script

## Overview
This repository contains a PowerShell script designed to address a specific issue with Plex Media Server. When transferring movie files to a NAS, Plex sometimes begins analyzing the file before the transfer is complete. This can lead to incorrect metadata, such as displaying a 2-hour movie as only 30 minutes long.

## Prerequisites
- Windows OS
- Plex Media Server installed
- PowerShell

## Usage
1. Clone this repository or download the `ReanalyzePlex.ps1` script.
2. Open a PowerShell terminal and navigate to the directory containing the script.
3. Run the script using:

   ```powershell
   .\ReanalyzePlex.ps1


## Customization

You can customize the behavior of the Plex analysis script by specifying the following parameters when running the script:

- `$plexPath` (Default: "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Scanner.exe"): Specifies the path to the Plex Media Scanner executable.

- `$logDirectory` (Default: "C:\plex"): Specifies the directory where log files will be saved.

- `$logFileName` (Default: "plex_analysis.log"): Specifies the name of the log file.

- `$maxRetries` (Default: 3): Specifies the maximum number of retries in case of failures during analysis.

- `$retryDelay` (Default: 10): Specifies the delay (in seconds) between retry attempts.

For example, to run the script with a different Plex Media Scanner path and log directory, you can execute it like this:

```powershell
.\ReanalyzePlex.ps1 -plexPath "C:\CustomPlex\Media Scanner.exe" -logDirectory "D:\CustomLogs"


### Note on Analysis Duration
When running the Plex Reanalysis Script, please be aware that the duration can vary based on several factors:

- **Library Size**: A larger collection of movies, TV shows, or other media will naturally extend the analysis time.

- **Media File Attributes**: High-definition or lengthy videos require more time to analyze compared to shorter or lower-resolution clips.

- **Server Capabilities**: The efficiency of your Plex server, including CPU speed, storage read/write rates, and available RAM, can influence the speed of analysis.

- **Network Factors**: If your media files are accessed over a network, such as from a NAS, the speed and reliability of that network play a role in the analysis time.

- **Depth of Analysis**: The script performs a deep analysis, which is more comprehensive than a basic scan. This thorough examination of each file ensures accuracy but can be time-intensive.

Given the depth of the analysis, especially on extensive libraries, consider running the script during times when you don't need immediate access to your Plex server or during off-peak hours.

## Scheduled Task Script
To automate the Plex Reanalysis, you can create a scheduled task using the provided script `CreatePlexAnalysisTask.ps1`. This script allows you to schedule the reanalysis task to run daily at a specific time, such as 2 AM. Simply provide the desired task name and script path as parameters when executing the script.

### Usage
```powershell
.\CreatePlexReanalysisTask.ps1 -TaskName "MyCustomTask" -ScriptPath "C:\Scripts\CustomScript.ps1
```

###

Replace "MyCustomTask" and "C:\Scripts\CustomScript.ps1" with your desired task name and script path.

### Feedback
If you encounter any issues or have suggestions for improvement, please open an issue on this repository.
