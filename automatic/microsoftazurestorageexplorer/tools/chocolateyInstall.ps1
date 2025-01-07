$ErrorActionPreference = 'Stop'
$checksum = 'e04fa2ca676e963b8c92e5eea50323b45182e2de25aec7fe98d0324db443085f'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.37.0/StorageExplorer-windows-x64.exe'

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
