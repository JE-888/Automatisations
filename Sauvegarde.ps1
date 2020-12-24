$FolderName = Read-Host -Prompt "Enter your folder name "
$IsCompressed = Read-Host -Prompt "Do you want to create a compressed folder ? (y/n) "
If (!(Test-Path -Path ./$FolderName)){New-Item -ItemType Directory -Name $FolderName}

Get-ChildItem |
ForEach-Object {
    If ($PSItem.Name -ne $FolderName -and $PSItem.Name -ne "Sauvegarde.ps1"){
    Copy-Item -Path $PSItem -Destination ./$FolderName -Recurse
    }
}

If ($IsCompressed -ne "n"){
    Compress-Archive -Path $FolderName -CompressionLevel "Fastest" -DestinationPath $FolderName
    Remove-Item -Path $FolderName -Recurse
}