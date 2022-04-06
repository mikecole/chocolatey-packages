$checksum = 'c14fdd1826061c21370d5b574267d02bc01a9d05f02df16baf5981004ddd5514'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.9.5721-965587f64/windows/PlexMediaServer-1.25.9.5721-965587f64-x86.exe'

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
