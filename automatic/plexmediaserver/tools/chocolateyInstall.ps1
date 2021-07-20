$checksum = 'c0c1833bc77f4675ad1c282555e969d6c4c29a4e9a9e1e681e78495d39566f79'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.5.4841-549599676/windows/PlexMediaServer-1.23.5.4841-549599676-x86.exe'

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
