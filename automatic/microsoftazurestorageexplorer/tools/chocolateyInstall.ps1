$ErrorActionPreference = 'Stop'
$checksum = '040142eb21fe02927e394e63360b76cccff1ce1782723ccc361b4bf8d3b4ccf8'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.45.0/StorageExplorer-windows-x64.exe'

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
