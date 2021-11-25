$ErrorActionPreference = 'Stop'

$checksum = '49852924e2c574e5a0ffb68a00d6ccf77028d875db0312277fe8e46f23a41667'
$url = 'https://builds.cdn.getgo.com/builds/g2m/19932/G2MSetup10.18.19932_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

$packageArgs = @{
  packageName    = 'gotomeeting'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet'
  validExitCodes = @(0)
  softwareName   = 'gotomeeting*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
