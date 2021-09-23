$ErrorActionPreference = 'Stop'

$checksum = '85bcdebf7c6d78833b49fd1e6fc3bce44b2330290dcf7fd533a4ac47eadb0897'
$url = 'https://builds.cdn.getgo.com/builds/g2m/19796/G2MSetup10.17.19796_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

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
