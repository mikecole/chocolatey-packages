$ErrorActionPreference = 'Stop'
$checksum = '8794cdb20f7da70a5b5e848eaec824476d22ced20bae5bc24d4c6e88f7015a26'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.40.0/StorageExplorer-windows-x64.exe'

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
