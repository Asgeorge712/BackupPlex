# PlexBackup (customized)

Backs up and restores Plex Media Server app data and registry keys on Windows.

Based on [alekdavis/PlexBackup](https://github.com/alekdavis/PlexBackup) v2.1.9 (MIT License), with local changes:

- Stops and restarts the `PlexMonitor` scheduled task around the backup
- Extra stop/start functions for the Plex Media Server process

## Usage

Run from an **admin** PowerShell window:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "D:\BackupPlex\PlexBackup.ps1" -SendLogFile Always -SendMail Always -Keep 3 -LogFile "D:\BackupPlex\PlexBackup.log" -ErrorLogFile "D:\BackupPlex\PlexBackup.err.log" -LogLevel Info -CredentialFile "D:\BackupPlex\gmail_cred.xml" -SmtpServer smtp.gmail.com -Port 587 -From paul@paulgeorge.com -To paul@paulgeorge.com
```

Settings in `PlexBackup.ps1.json` (if present) override the command line.

## Not in the repo

- `*.xml` credential files: create with `Get-Credential | Export-CliXml -Path "D:\BackupPlex\gmail_cred.xml"` (Gmail app password as the password)
- `PlexBackup.ps1.json` local config
- Backups, logs and downloaded modules
