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
You can modify the default parameters in the script, such as the path to the Plex Media Scanner, log directory, and more.

## Feedback
If you encounter any issues or have suggestions for improvement, please open an issue on this repository.
