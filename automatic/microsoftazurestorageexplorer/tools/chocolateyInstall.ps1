$ErrorActionPreference = 'Stop'
$checksum = 'ff31165449e4ca13040e0bd2ab88433db945f73bcd64782b1e537bd933c6b3c5'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.35.0/StorageExplorer-windows-x64.exe'

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
