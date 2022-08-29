$checksum = 'cb3a39a9c5f078f5f0c3b926562fa6abc8b1d576854966aa0188b281152152f8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.28.2.6106-44a5bbd28/windows/PlexMediaServer-1.28.2.6106-44a5bbd28-x86.exe'

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
