$emacsNameVersion = 'emacs-26.1'
$url = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-26/$($emacsNameVersion)-i686.zip"
$url64 = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-26/$($emacsNameVersion)-x86_64.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $url $toolsDir $url64 `
  -Checksum D8C1486304462A368911ACC4628BA5433D5D6AF6A25511504F324A3CD405131B `
  -ChecksumType 'SHA256' `
  -Checksum64 995A9DA608C8DCA75C385769C1C7BF212AC39713C0D14E9AF2E718363B5E8264 `
  -ChecksumType64 'SHA256'

$emacsDepsVersion = 'emacs-26'
$deps = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-26/$($emacsDepsVersion)-i686-deps.zip"
$deps64 = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-26/$($emacsDepsVersion)-x86_64-deps.zip"
Install-ChocolateyZipPackage 'Emacs' $deps $toolsDir $deps64 `
  -Checksum 4ff9057d4407f2d1149f158a2920acd09c31eff12a09ba25dc1776a3978f41ad `
  -ChecksumType 'SHA256' `
  -Checksum64 3501E0C7F31CBF98EF7AC5CBBC8BAE04EF4A72F52B00898965A8D702C4A5FAE7 `
  -ChecksumType64 'SHA256'
