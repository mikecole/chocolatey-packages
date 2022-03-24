$checksum = '60ebcf754c52e4c0a75666779fa9d78acc155f6fc74c14ed95957d4c8769f281'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.8.5663-e071c3d62/windows/PlexMediaServer-1.25.8.5663-e071c3d62-x86.exe'

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
