$ErrorActionPreference = 'Stop'
$checksum = '9160fe61df25ddcb2ef12678821f76c0178fe09bd5eed3b7f93419819b39b4c4'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.31.1/StorageExplorer-windows-x64.exe'

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
