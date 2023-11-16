$ErrorActionPreference = 'Stop'
$checksum = '58a1c4f853b3dbc7e03333c0b90f6642efd1e98c7e461b6efc548d6517441545'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.32.1/StorageExplorer-windows-x64.exe'

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
