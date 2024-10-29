$ErrorActionPreference = 'Stop'
$checksum = '8776a0e33d8ff04a9bbf94df991f022e826f83f7e663364219001dd78bf4faf6'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.36.2/StorageExplorer-windows-x64.exe'

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
