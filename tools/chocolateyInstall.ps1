$emacsNameVersion = 'emacs-25.3'
$url = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-i686.zip"
$url64 = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)_1-x86_64.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $url $toolsDir $url64 `
  -Checksum d166faece3a3cb55fb9bd240724265649a0c599fac0ee0da2ebb0753d1b31ad9 `
  -ChecksumType 'SHA256' `
  -Checksum64 716698025746cd38684a939702aacee6080064224cce517b055b8a182c693423 `
  -ChecksumType64 'SHA256'

$emacsDepsVersion = 'emacs-25'
$deps = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsDepsVersion)-i686-deps.zip"
$deps64 = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsDepsVersion)-x86_64-deps.zip"
Install-ChocolateyZipPackage 'Emacs' $deps $toolsDir $deps64 `
  -Checksum 37daea32cc054ae6b709c015704bdf7b7459c63b1be27cdd590d2807e50b236a `
  -ChecksumType 'SHA256' `
  -Checksum64 d928e6caaeb5267f978dad0a54c90b0ea6f31ad384f43d8a6bb54c67d2b2f184 `
  -ChecksumType64 'SHA256'
