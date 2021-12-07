$checksum = 'c04ab36d3b9a5c90e3fc177e7d76fe53325378d2580c30fae6a59c957b4588a1'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.1.5286-34f965be8/windows/PlexMediaServer-1.25.1.5286-34f965be8-x86.exe'

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
