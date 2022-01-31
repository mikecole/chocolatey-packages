$checksum = '9eaa0c4ba73f6d6a8f63d9023b416cf9fb4e13afd0a82de651b6615b35d69d46'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.4.5468-989df2310/windows/PlexMediaServer-1.25.4.5468-989df2310-x86.exe'

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
