$ErrorActionPreference = 'Stop'
$checksum = '0af583a9d09d02cf06e1bd3e2227733c9acde2ccd0ff9c41d4769b3d24889284'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.42.0/StorageExplorer-windows-x64.exe'

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
