$checksum = '50298cb894b666e128776a4909eef8843b4c7a48a4ee81c22fdbf4f629be12a4'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.4.5487-648a8f9f9/windows/PlexMediaServer-1.25.4.5487-648a8f9f9-x86.exe'

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
