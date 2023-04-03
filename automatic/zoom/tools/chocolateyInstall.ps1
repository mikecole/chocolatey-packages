$ErrorActionPreference = 'Stop'
$checksum = 'd5611253320c41d5e03dfec42f2a07dce3cedf5a51caba0b80cee733582fde05'
$checksum64 = '0225cac020c2586c8e7798c66e382a9d75c18d139dde0cfc45408f467cc05fc4'

$url = 'https://cdn.zoom.us/prod/5.14.2.14578/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.2.14578/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
