$ErrorActionPreference = 'Stop'
$checksum = '56e83155879f7bf0ae397961123af1c3ddafc747d2f3fff59f17cd17309601f9'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.31.2/StorageExplorer-windows-x64.exe'

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
