$checksum = '386d5062f858fc9630a016aa6c7d8523602445c1635cb7270b5e35d5fb1fa894'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.30.1.6562-915986d62/windows/PlexMediaServer-1.30.1.6562-915986d62-x86.exe'

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
