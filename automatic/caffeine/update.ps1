$ErrorActionPreference = 'Stop'
import-module au

$download_page_url = 'https://www.zhornsoftware.co.uk/caffeine/index.html'
$url32 = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
     }
}
function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $url32
}

function global:au_GetLatest {
    $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url

     # Get Version
    $homepage_content -match 'v\d+\.\d+'| Out-Null
    $version = $matches[0] -replace "v", ""

    $Latest = @{ Version = $version }
    return $Latest
}

update -ChecksumFor none
