$ErrorActionPreference = 'Stop'
$checksum = '167186b00aa0984f07e575e53ebef23aea207edd33231b180bdf20975ec653f1'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.25.0/Windows_StorageExplorer.exe'

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
