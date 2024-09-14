$ErrorActionPreference = 'Stop'
$checksum = 'dd068642b85b4305c4866959f3ac2a05012ddf3ed51d62c90c7a44baa017b467'
$checksum64 = '69f8bdaedc342f653e36e1fed3d6be966b70a84e2aef043b5777f14b80a28e41'

$url = 'https://cdn.zoom.us/prod/6.2.0.46690/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.0.46690/x64/ZoomInstallerFull.msi'

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
