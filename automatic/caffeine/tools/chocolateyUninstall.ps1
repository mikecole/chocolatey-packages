$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName = 'caffeine'
    zipFileName = 'caffeine.zip'
}

Write-Output "If Caffeine is currently running on this machine, it will be closed prior to being uninstalled."
Get-Process caffeine -ea 0 | Stop-Process

Uninstall-ChocolateyZipPackage @packageArgs
