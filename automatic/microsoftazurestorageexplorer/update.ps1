$ErrorActionPreference = 'Stop'
import-module au

$latestRelease = 'https://api.github.com/repos/microsoft/AzureStorageExplorer/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)('.*')"   = "`$1'$($Latest.URL)'"
        }
     }
}

function global:au_GetLatest {
    $file_name = 'StorageExplorer-windows-x64.exe'
    $windows_release = (Invoke-RestMethod $latestRelease).assets | Where-Object {$_.name -eq $file_name}

    $url = $windows_release.browser_download_url
    $version32 = $url.Replace("https://github.com/microsoft/AzureStorageExplorer/releases/download/v", "").Replace("/$file_name", "")

    @{
        URL = $url
        Version = $version32
    }
}

update -NoCheckUrl -ChecksumFor 32