$ErrorActionPreference = 'Stop'
$checksum = '16aad3aef473ef3226d8c1aebac77add570bb9fe958f96395341eab6dcfd62e9'
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
