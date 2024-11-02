$ErrorActionPreference = 'Stop'
$checksum = '4a259c348e59eb51bbb75aac7fdcc798705496d575892ee1e01fff6970d5ba1c'

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
