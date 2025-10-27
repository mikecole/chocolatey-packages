$ErrorActionPreference = 'Stop'
$checksum = '80f95113051da723ef2b69d4e732c55ef6acdbb1fb80b0c3eb0606a2b53018fb'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.40.1/StorageExplorer-windows-x64.exe'

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
