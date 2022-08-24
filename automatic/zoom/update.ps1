$ErrorActionPreference = 'Stop'
import-module au

$download_page_url = 'https://zoom.us/rest/download?os=win'
$url_part1 = 'https://zoom.us/client/'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)('.*')"   = "`$1'$($Latest.Url32)'"
            "(^[$]checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(^[$]url64\s*=\s*)('.*')"   = "`$1'$($Latest.Url64)'"
        }
     }
}
function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url
    $payload = ConvertFrom-Json $response

     # Get Version
    $version = $payload.result.downloadVO.zoom.version
    $url32 = $url_part1 + $version + '/ZoomInstallerFull.msi'
    $url64 = $url_part1 + $version + '/ZoomInstallerFull.msi?archType=x64'

    $Latest = @{ URL32 = $url32; URL64=$url64; Version = $version }
    return $Latest
}

update -ChecksumFor none