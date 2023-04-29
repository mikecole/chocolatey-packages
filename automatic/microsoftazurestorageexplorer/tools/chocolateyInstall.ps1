$ErrorActionPreference = 'Stop'
$checksum = '05d4ef58140b0449f93e10bc489303adbecf80fa8bdabe98a423c1e8ed0eef7c'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.29.0/StorageExplorer-windows-ia32.exe'

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
