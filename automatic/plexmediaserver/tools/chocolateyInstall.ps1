$checksum = '966d8dc0310cc38c8cd116fb74f2c9bac73e218fc1ab175ac33e6829ed493106'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.7.5604-980a13e02/windows/PlexMediaServer-1.25.7.5604-980a13e02-x86.exe'

Start-CheckandStop "Plex Media Server"

$packageArgs = @{
  packageName   = 'plexmediaserver'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'plexmediaserver*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

if ($ProcessWasRunning -eq "True") {&$ProcessFullPath}
