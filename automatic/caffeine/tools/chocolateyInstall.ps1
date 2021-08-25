$ErrorActionPreference = 'Stop'
$checksum = '083b16e4100e7a59f8ac5094938a88da47b2547f5b9eac21cc55c96ad9200585'

$packageArgs = @{
  packageName    = 'caffeine'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'zip'
  url            = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
  validExitCodes = @(0)
  checksum       = $checksum 
  checksumType   = 'sha256'
}

Write-Output "If an older version of Caffeine is running on this machine, it will be closed prior to the installation of the newer version."
Get-Process caffeine -ea 0 | Stop-Process

Install-ChocolateyZipPackage @packageArgs
