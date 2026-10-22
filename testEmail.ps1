# Load credentials
$credFile = "D:\BackupPlex\cred-file.xml"
$cred = Import-Clixml -Path $credFile

$smtpServer = "smtp.gmail.com"
$port = 587
$from = $cred.UserName
$to = "paul@paulgeorge.com"

Send-MailMessage -From $from -To $to -Subject "Test Email from PlexBackup" -Body "This is a test." -SmtpServer $smtpServer -Credential $cred -UseSsl -Port $port