$checksum = 'b5601e6703e0269a3f5ecc3a38782ba8da638e1e30bd154bb293a494b03b0427'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.29.0.6244-819d3678c/windows/PlexMediaServer-1.29.0.6244-819d3678c-x86.exe'

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
