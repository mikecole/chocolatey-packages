$ErrorActionPreference = 'Stop'
$checksum = 'c798b2aedc7a74f0daf51eb216aae8cb48b45f208b0409916442b1d61d2ad2ef'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.34.0/StorageExplorer-windows-x64.exe'

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
