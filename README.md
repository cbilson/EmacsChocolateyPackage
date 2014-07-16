# EmacsChocolateyPackage

## Installation

Use [Chocolatey](http://chocolatey.org/) to install this package:

```powershell
> cinst emacs
```

## Hacking

Ah, yes, the real reason I made this readme. I can never remember how
to deploy this.

  1. CD to the directory where you've checked out the source.
  2. Type `cpack`.

To deploy, just go to the chocolatey website and upload the package.

### Even Better

```powershell
> cpack
...
# get api key from https://chocolatey.org/account
# only need to this once
> nuget setApiKey deadbeef-dead-beef-dead-deaddeadbeef -Source http://chocolatey.org/
...
> cpush
```

## Versioning

Apparently I need a unique version number to use the `cpush` command
mentioned above, so from now on, the emacs chocolatey package will
be versioned with first 3 segments from the emacs version, final
segment as the date of the release, as described [here](https://github.com/chocolatey/chocolatey/wiki/CreatePackages#package-fix-version-notation).
