$ErrorActionPreference = 'Stop'
$checksum = '3bb6a142cff542b020f49ad211d93c2ec1e3911e662567eec9f1b1fc1e950ea3'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.24.3/Windows_StorageExplorer.exe'

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
