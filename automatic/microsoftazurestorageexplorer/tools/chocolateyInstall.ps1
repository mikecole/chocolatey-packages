$ErrorActionPreference = 'Stop'
$checksum = 'df4fad7ca1f19b0489cde1a048432f1f0af02aac44c4efe7acc96af0c8c3e8bc'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.32.0/StorageExplorer-windows-x64.exe'

$packageArgs = @{
  packageName    = 'microsoftazurestorageexplorer'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = $url
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS'
  validExitCodes = @(0)
  softwareName   = 'microsoftazurestorageexplorer*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
