$emacsNameVersion = 'emacs-25.3'
$url = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-i686.zip"
$url64 = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)_1-x86_64.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $url $toolsDir $url64 `
  -Checksum d166faece3a3cb55fb9bd240724265649a0c599fac0ee0da2ebb0753d1b31ad9 `
  -ChecksumType 'SHA256' `
  -Checksum64 716698025746cd38684a939702aacee6080064224cce517b055b8a182c693423 `
  -ChecksumType64 'SHA256'
