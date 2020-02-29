$directory = $Args[0];
$fileName = $Args[1];
$backupDirectory = $Args[2];

$filePath = -join($directory, "\", $fileName);
$archiveFilePath = -join($filePath, "_$(get-date -f yyyy-MM-dd).7z");

# Delete the existing backup. Get's all items with this name
get-childitem -path $backupDirectory -filter *$fileName* | remove-item

# Create a new archive
& $PSScriptRoot"\create-zip-archive.ps1" $filePath $archiveFilePath

# Move the new archive to Backup folder
move-item $archiveFilePath $backupDirectory

