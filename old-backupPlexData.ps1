# Variables
# The directory to zip
$sourceDir = "C:\Users\paulg\AppData\Local\Plex Media Server"

# Subdirectory to exclude
$excludeDir = "C:\Users\paulg\AppData\Local\Plex Media Server\Cache"

# Current date and time for the filename
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

# Path for the output zip file
$zipFile = "D:\Backups\Archive_$timestamp.zip"

# List of directories to zip
$directories = @(
    "C:\Users\paulg\AppData\Local\Plex Media Server\Codecs",
    "C:\Users\paulg\AppData\Local\Plex Media Server\Media",
    "C:\Users\paulg\AppData\Local\Plex Media Server\Metadata",
    "C:\Users\paulg\AppData\Local\Plex Media Server\Plug-in Support",
    "C:\Users\paulg\AppData\Local\Plex Media Server\Plug-ins",
    "C:\Users\paulg\AppData\Local\Plex Media Server\Scanners",
    "C:\Users\paulg\AppData\Local\Plex Media Server\Updates"
)

# Output directory for ZIP files
$outputDir = "D:\Backups"

# Ensure the output directory exists & create if it's not there
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Process each directory
foreach ($dir in $directories) {
    if (Test-Path -Path $dir) {
		
		# Get the directory name
        $dirName = Split-Path -Path $dir -Leaf
		
		#Write-Host "dirName: $dirName"
		
		$fileName = $dirName + "_" + $timestamp
		#Write-Host "fileName: $fileName"
		$fileName = $fileName -replace " ", ""
		
		# Output ZIP file path
        $zipFile = Join-Path -Path $outputDir -ChildPath "$filename"
		Write-Host "Zipping up $dir to zip name: $zipFile"
		
        # Compress the directory
        Compress-Archive -Path "$dir\*" -DestinationPath $zipFile -Force
		
        Write-Host "Zipped '$dir' to '$zipFile'"
    } else {
        Write-Warning "Directory not found: $dir"
    }
}

Write-Host "All directories have been processed."