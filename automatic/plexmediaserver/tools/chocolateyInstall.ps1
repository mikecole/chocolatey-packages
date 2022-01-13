$checksum = 'eaf6a92d34fa9f90b3164f22e21e9cb99667b92a3ad4ba2e0c388080970b744e'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.3.5409-f11334058/windows/PlexMediaServer-1.25.3.5409-f11334058-x86.exe'

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
