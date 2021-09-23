$ErrorActionPreference = 'Stop'
$checksum = '874788B45DFC043289BA05387E83F27B4A046004A88A4C5EE7C073187FF65B9D'

Start-CheckandStop "Steam"

$packageArgs = @{
  packageName   = 'steam-client'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'http://media.steampowered.com/client/installer/SteamSetup.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'steam*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

if ($ProcessWasRunning -eq "True") {&$ProcessFullPath}
