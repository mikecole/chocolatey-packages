$ErrorActionPreference = 'Stop'
$checksum = '639e402eb0249fb5b62d24b2de1be5842088a6a1b02d61d7b09c91a043c5c9cb'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.33.0/StorageExplorer-windows-x64.exe'

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
