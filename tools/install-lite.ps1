Import-Module "$(Split-Path -parent $MyInvocation.MyCommand.Definition)/install.psm1"

Install-ChocolateyZipPackage @NoDepsPackageArgs

Install-ChocolateyZipPackage @DepsPackageArgs -specificFolder 'bin'
Install-ChocolateyZipPackage @DepsPackageArgs -specificFolder 'etc'
Install-ChocolateyZipPackage @DepsPackageArgs -specificFolder 'libexec'
Install-ChocolateyZipPackage @DepsPackageArgs -specificFolder 'ssl'

New-ShimHintFiles
