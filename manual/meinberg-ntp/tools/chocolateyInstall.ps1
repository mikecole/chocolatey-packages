$packageArgs = @{
  packageName   = 'meinberg-ntp'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'https://www.meinbergglobal.com/download/ntp/windows/ntp-4.2.8p15-win32-setup.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'Network Time Protocol*'
  checksum      = 'D8CC9BD0142792B5A53DF2C18FFA7A92E01081129C8B4AD2BC2BF4A6714951BF'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
