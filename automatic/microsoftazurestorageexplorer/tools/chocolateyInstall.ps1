$ErrorActionPreference = 'Stop'
$checksum = '6c248ed66b69ff8867ebd07bb0f86f741cd91ca4a9caeb01b755ed0656abebce'
$url = 'https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.47.1/StorageExplorer-windows-x64.exe'

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
