$ErrorActionPreference = 'Stop'
$checksum = '7550f00d1c155321b221da5c6af655e95b7c142bb4e20f14877bd249ed2d2767'
$checksum64 = 'f53d82d9ff930f6504e0fc7070664f45d4e7bc0826584b1b9ad40dff7d0cb4e0'

$url = 'https://cdn.zoom.us/prod/6.1.11.45504/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.11.45504/x64/ZoomInstallerFull.msi'

$silentArgs = '/quiet /qn /norestart'

$pp = Get-PackageParameters

if ($pp['DisableRestartManager']) { $silentArgs += " MSIRestartManagerControl=Disable" }
if ($pp['NoAutoUpdate']) { $silentArgs += " ZoomAutoUpdate=False" }
else { $silentArgs += " ZoomAutoUpdate=True" }
if ($pp['NoDesktopShortcut']) { $silentArgs += " zNoDesktopShortCut=True" }
if ($pp['NoInstallIfRunning']) { 
  if (Get-Process zoom -ea 0) {
    Write-Warning "Exiting installation because Zoom is running and /NoInstallIfRunning was passed."
    exit 1
  }
}
if ($pp['SilentStart']) { $silentArgs += " zSilentStart=True" }
if ($pp['SSOHost']) { $silentArgs += " zSSOHost=$(pp['SSOHost'])" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = $silentArgs
  validExitCodes = @(0, 3010)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

$ZoomPath = Join-Path -Path $Env:ProgramFiles -ChildPath 'Zoom\bin\Zoom.exe'

[Version]$InstalledVersion = (Get-ItemProperty -Path $ZoomPath -ErrorAction:Ignore).VersionInfo.FileVersionRaw

$UpdateNeeded = $InstalledVersion -lt [Version]$Env:ChocolateyPackageVersion

if ($UpdateNeeded -or $Env:ChocolateyForce)
{
  Install-ChocolateyPackage @packageArgs
}
