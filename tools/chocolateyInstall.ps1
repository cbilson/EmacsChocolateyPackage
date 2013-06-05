Install-ChocolateyZipPackage 'Emacs' 'http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-24.3-bin-i386.zip' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $env:ChocolateyInstall\lib\Emacs.24.3\tools\emacs-24.3\bin\addpm.exe