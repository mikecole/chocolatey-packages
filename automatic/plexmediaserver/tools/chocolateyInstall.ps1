$checksum = '015e05d8d3d771609d35f093f3cf8e3c14e35205f29f5a8767784683b9bdc43b'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.27.2.5929-a806c5905/windows/PlexMediaServer-1.27.2.5929-a806c5905-x86.exe'

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
