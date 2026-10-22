# BackupPlex
A Plex Backup program - improved

Backs up and restores Plex Media Server app data and registry keys on Windows.

Based on [alekdavis/PlexBackup](https://github.com/alekdavis/PlexBackup) v2.1.9 (MIT License), with local changes:

- Stops and restarts the `PlexMonitor` scheduled task around the backup
- Extra stop/start functions for the Plex Media Server process

## Usage

Run from an **admin** PowerShell window:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "D:\BackupPlex\PlexBackup.ps1" -CredentialFile "D:\BackupPlex\gmail_cred.xml" -From paul@paulgeorge.com -To paul@paulgeorge.com
```

The scheduled task uses the same arguments.

## Settings

All non-sensitive settings live in `PlexBackup.ps1.json` (7-Zip, backup folder, keep 3, email always with the log attached, SMTP server). The credential file and email addresses are passed on the command line instead.

Parameters given on the command line take precedence over the JSON file; the JSON only fills in parameters that are not on the command line.

## Not in the repo

- `*.xml` credential files: create with `Get-Credential | Export-CliXml -Path "D:\BackupPlex\gmail_cred.xml"` (Gmail app password as the password)
- Backups, logs and downloaded modules
