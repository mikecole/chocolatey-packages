$ErrorActionPreference = 'Stop'
$checksum = '0d6ff1c282cffa003a4c281d92bcc3a4d6581e1158855c19fa54444a7d1de481'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.43.0/StorageExplorer-windows-x64.exe'

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
