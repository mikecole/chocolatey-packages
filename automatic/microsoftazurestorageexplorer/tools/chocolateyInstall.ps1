$ErrorActionPreference = 'Stop'
$checksum = '380e09264282cb0b1c84f2d13bfbbebd6d48d66f522414ecedaa544e8cf5003f'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.41.0/StorageExplorer-windows-x64.exe'

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
