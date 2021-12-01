$checksum = 'ba632e951b6ea023e693a5dec883894148d51a0a1f3d5e92b74d2402f8678846'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.0.5282-2edd3c44d/windows/PlexMediaServer-1.25.0.5282-2edd3c44d-x86.exe'

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
