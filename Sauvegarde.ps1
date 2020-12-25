$TargetPath = Read-Host -Prompt "Enter the path of the folder you want to save "
$FolderName = Read-Host -Prompt "Enter the name of the save folder "
Set-Location -Path $TargetPath

Compress-Archive -Path $TargetPath -CompressionLevel "Fastest" -DestinationPath $FolderName -Force
