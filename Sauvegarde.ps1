$TargetPath = Read-Host -Prompt "Enter the path of the folder you want to save "
Set-Location -Path $TargetPath
If (!(Test-Path -Path ./save)){New-Item -ItemType Directory -Name save}

Get-ChildItem |
ForEach-Object {
    If ($PSItem.Name -ne "save" -and $PSItem.Name -ne "Sauvegarde.ps1"){
    Copy-Item -Path $PSItem -Destination ./save -Recurse
    }
}

Compress-Archive -Path save -CompressionLevel "Fastest" -DestinationPath save -Force
Remove-Item -Path save -Recurse
