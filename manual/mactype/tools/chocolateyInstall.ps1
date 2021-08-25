$checksum = '3A73D19D4940B6308D07F1EB19A9B6DB007423F3D2EBBA1216F2DF224A8B01F5'
$url = 'https://github.com/snowie2000/mactype/releases/download/2021.1-rc1/MacTypeInstaller_2021.1-rc1.exe'

$packageArgs = @{
  packageName   = 'mactype'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'MacType*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
