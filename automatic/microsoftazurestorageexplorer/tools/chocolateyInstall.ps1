$ErrorActionPreference = 'Stop'
$checksum = '5b1b672656daf485e0920805cfc797a337487c0c17782d3fd3a6f102c4eeada9'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.23.1/Windows_StorageExplorer.exe'

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
