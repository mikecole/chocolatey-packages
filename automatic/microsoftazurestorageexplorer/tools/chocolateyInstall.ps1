$ErrorActionPreference = 'Stop'
$checksum = 'ec5480c78210e2f2d3b7b03bd4922de99939be4d974e822d431f2dda033eda13'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.24.2/Windows_StorageExplorer.exe'

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
