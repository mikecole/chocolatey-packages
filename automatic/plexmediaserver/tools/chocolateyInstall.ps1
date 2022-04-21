$checksum = '455c4b54558384225e95996ea91d96793e5c10c0d3046dc8ff4c62c7f86e2734'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.26.0.5715-8cf78dab3/windows/PlexMediaServer-1.26.0.5715-8cf78dab3-x86.exe'

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
