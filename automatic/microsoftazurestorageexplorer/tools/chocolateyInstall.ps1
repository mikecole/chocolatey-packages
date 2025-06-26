$ErrorActionPreference = 'Stop'
$checksum = '50bcc4bccc1ad53409e3ca86344fd0c7259b570657fb57dac4aee78298454649'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.39.0/StorageExplorer-windows-x64.exe'

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
