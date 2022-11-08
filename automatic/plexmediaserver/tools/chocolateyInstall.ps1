$checksum = '3f69624eb496ba1981608264181b0f4c28b69c92378ee2cce12eda6c4fdcda8e'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.29.2.6364-6d72b0cf6/windows/PlexMediaServer-1.29.2.6364-6d72b0cf6-x86.exe'

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
