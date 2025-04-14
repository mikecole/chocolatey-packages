$ErrorActionPreference = 'Stop'
$checksum = 'c7aa0dd5316db2347ed1b808f887ee3b7d7d33c65dbcd2de184a95c87f5380bf'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.38.0/StorageExplorer-windows-x64.exe'

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
