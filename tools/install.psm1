$packageName = 'emacs'

$majorVersion = '27'
$minorVersion = '1'

$emacsNameVersion = "$($packageName)-$($majorVersion).$($minorVersion)"
$installDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition) + '/' + $packageName

$FullPackageArgs = @{
    packageName    = $packageName
    unzipLocation  = $installDir
    url            = "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-$($majorVersion)/$($emacsNameVersion)-i686.zip"
    url64bit       = "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-$($majorVersion)/$($emacsNameVersion)-x86_64.zip"
    checksum       = 'bd99eae036b229e6105c070499c63994870c839c70404a12c04992e0c0fa0b5b'
    checksumType   = 'sha256'
    checksum64     = '3b0b2e9355fccd07f67bc7272cabeaa6ae82f8f3cbe54008b611a331f61b4c7d'
    checksumType64 = 'sha256'
}

$NoDepsPackageArgs = @{
    packageName    = $packageName
    unzipLocation  = $installDir
    url            = "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-$($majorVersion)/$($emacsNameVersion)-i686-no-deps.zip"
    url64bit       = "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-$($majorVersion)/$($emacsNameVersion)-x86_64-no-deps.zip"
    checksum       = 'd9a5d3513f8aad075068db2f41a08676f50db900b62ce32c6edd54cbc7c54392'
    checksumType   = 'sha256'
    checksum64     = 'dc00a3bd152d984f079472d2fb34af6ae4beb9bfef56162d6aa4a6685571900a'
    checksumType64 = 'sha256'
}

$emacsDepsVersion = "emacs-$($majorVersion)"

$DepsPackageArgs = @{
  packageName    = $packageName
  unzipLocation  = $installDir
  url            = "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-$($majorVersion)/$($emacsDepsVersion)-i686-deps.zip"
  url64bit       = "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-$($majorVersion)/$($emacsDepsVersion)-x86_64-deps.zip"
  checksum       = '4ff9057d4407f2d1149f158a2920acd09c31eff12a09ba25dc1776a3978f41ad'
  checksumType   = 'sha256'
  checksum64     = '3501e0c7f31cbf98ef7ac5cbbc8bae04ef4a72f52b00898965a8d702c4a5fae7'
  checksumType64 = 'sha256'
}

function New-ShimHintFiles() {
    # Exclude executables from getting shimmed
    $guiExes = @("runemacs.exe", "emacsclientw.exe")
    $shimExes = @("emacs.exe", "emacsclient.exe")

    $guiFilter = "^" + $($guiExes -join "$|^") + "$"
    $shimFilter = "^" + $($shimExes -join "$|^") + "$"

    $files = Get-Childitem $installDir -include *.exe -recurse

    foreach ($file in $files) {
        if ($file.Name -match $guiFilter) {
            #generate an gui file
            New-Item "$file.gui" -type file -force | Out-Null
        }
        elseif (-not ($file.Name -match $shimFilter)) {
            #generate an ignore file
            New-Item "$file.ignore" -type file -force | Out-Null
        }
    }
}

Export-ModuleMember -Variable 'FullPackageArgs'
Export-ModuleMember -Variable 'NoDepsPackageArgs'
Export-ModuleMember -Variable 'DepsPackageArgs'
Export-ModuleMember -Function 'New-ShimHintFiles'
