$ErrorActionPreference = 'Stop'
$checksum = '4078079e105fa1528506251d0a402fa9e209b1c5916df977a7ed0b7c9f75ccc5'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.28.0/Windows_StorageExplorer.exe'

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
