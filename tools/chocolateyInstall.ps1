$emacsNameVersion = 'emacs-25.1'
$url = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-i686-w64-mingw32.zip"
$url64 = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-x86_64-w64-mingw32.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $url $toolsDir $url64 `
  -Checksum e4874839e6d164e74b023f091cd2f4545aeeee190a895c91b49670e11dfadaf7 `
  -ChecksumType 'SHA256' `
  -Checksum64 dd64f517c58226ccc385b6d06124a581337a4420b7e519664ed93fbbc505f2f9 `
  -ChecksumType64 'SHA256'
