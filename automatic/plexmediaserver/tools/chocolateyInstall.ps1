$checksum = 'b7315b79fe09093506df9e115396993597943cdab8591e74c0b248a17b2821a0'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.28.0.5999-97678ded3/windows/PlexMediaServer-1.28.0.5999-97678ded3-x86.exe'

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
