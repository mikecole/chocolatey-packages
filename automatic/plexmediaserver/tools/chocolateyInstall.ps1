$checksum = '756d62121b4f56eaa3fa8986ac735e7a46ac5976144f3db84063760943de6fef'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.31.0.6654-02189b09f/windows/PlexMediaServer-1.31.0.6654-02189b09f-x86.exe'

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
