# Requires 7zip and Environment Variable path pointing to 7-zip install
Function create-zip-archive($filePath, $archiveFilePath) 
{
	[Array]$arguments = "a", "-tzip", "$archiveFilePath", "$filePath";
	& "7z" $arguments;
}

$filePath = $Args[0];
$archiveFilePath = $Args[1];

create-zip-archive $filePath $archiveFilePath
