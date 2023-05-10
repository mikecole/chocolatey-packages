$ErrorActionPreference = 'Stop'
$checksum = '2f3ce6caf724248942ee5031d48e300d14438c1387fdd9fe753a25c87ef866d2'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.29.1/StorageExplorer-windows-ia32.exe'

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
