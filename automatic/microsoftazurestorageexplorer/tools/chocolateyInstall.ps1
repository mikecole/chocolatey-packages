$ErrorActionPreference = 'Stop'
$checksum = '5e7917fa7e1b22becb720e86edf8f3005e489140bcbed02e1ce2059dee7447ab'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.22.1/Windows_StorageExplorer.exe'

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
