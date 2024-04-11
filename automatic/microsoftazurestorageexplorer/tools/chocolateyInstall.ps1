$ErrorActionPreference = 'Stop'
$checksum = 'df05636774ced1984ebb6e34d57570f5800dca35c07b53ef3f8eb47fa56379e3'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.33.1/StorageExplorer-windows-x64.exe'

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
