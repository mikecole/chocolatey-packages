$ErrorActionPreference = 'Stop'
$checksum = 'b19d61a5ed4323e59ec35475f18c104ee41ebd81d6062346ffc4e83b99d4858e'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.28.1/StorageExplorer-windows-ia32.exe'

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
