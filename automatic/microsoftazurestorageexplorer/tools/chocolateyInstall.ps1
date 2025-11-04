$ErrorActionPreference = 'Stop'
$checksum = 'fc44425058cafca14c542e2bf4d21f21865bfce6f413bd6d5173a8f07f08769f'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.40.2/StorageExplorer-windows-x64.exe'

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
