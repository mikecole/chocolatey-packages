$checksum = '94e7f1f27df16f3ed3b293d252f599461e521edf77057fa408e977d7362ef9a5'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.2.5319-c43dc0277/windows/PlexMediaServer-1.25.2.5319-c43dc0277-x86.exe'

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
