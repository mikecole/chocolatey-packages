$checksum = '5b4041ef8cc087f70237fa86ce724d8b332754809bf6a464cf3ae2d73d8fd987'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.26.2.5797-5bd057d2b/windows/PlexMediaServer-1.26.2.5797-5bd057d2b-x86.exe'

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
