$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = 'clipcache'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'https://www.xrayz.co.uk/download/ccsetup.exe'
  silentArgs    = '/VERYSILENT'
  validExitCodes= @(0)
  softwareName  = 'clipcache*'
  checksum      = 'fe8a2fd8cdadbddca9a48d75dcbb84df53cecd2c256019efaafce981f0704fb1'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs