$ErrorActionPreference = 'Stop'
$checksum = '716cc01079d9e1c02cdebe07a54b31ec82232721ed86b7ac56887113bcfd4e31'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.24.0/Windows_StorageExplorer.exe'

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
