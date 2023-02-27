$checksum = 'a900c603dd1b106ccdc00423ddced74175620c58d21907013f5d62084c695051'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.31.1.6733-bc0674160/windows/PlexMediaServer-1.31.1.6733-bc0674160-x86.exe'

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
