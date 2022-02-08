$checksum = '7018be24d581c8e65dcc3125666115fb146c541b5249f85b2432149b806b5ac8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.5.5492-12f6b8c83/windows/PlexMediaServer-1.25.5.5492-12f6b8c83-x86.exe'

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
