$ErrorActionPreference = 'Stop'
$checksum = '3de6cf31a971b2ec19dda57b1d75f8c850ac329ea8aed31e67746d9c5cafcf55'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.29.2/StorageExplorer-windows-ia32.exe'

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
