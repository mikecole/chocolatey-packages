$ErrorActionPreference = 'Stop'
$checksum = '2aec3da3f7fff243279a86ab2fbece419e3867ff5ac97d45296edbd150d62349'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.46.0/StorageExplorer-windows-x64.exe'

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
