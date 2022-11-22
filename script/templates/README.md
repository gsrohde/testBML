## %1$s
PUT AN OVERVIEW OF THE MODULE LIBRARY HERE

### Installation

#### Requirements
- The [R environment](https://cran.r-project.org/).
- On Windows, a version of [Rtools](https://cran.r-project.org/bin/windows/Rtools/)
  appropriate for your version of R.
- On Linux, gcc and g++ version 4.9.3 or greater (consult documentation for your
  distribution for installation instructions).
- On MacOS, Xcode.

#### Installation steps
First obtain a local copy of this repository. It contains a git submodule, so
the "Download ZIP" option from the GutHub website will not work properly.
Instead, the easiest way to get a local copy is to install GitHub Desktop and
use the "Open with GitHub Desktop" option from the GitHub website.
Alternatively, if you are familiar with command-line git, you can clone the
repository as usual and then use `git submodule update --init` to get the
submodule code.

After obtaining a local copy of the source code, install the package from the
command line or from within R using one of the following sets of commands. These
assume that the source files are in a directory named  '%1$s'.

- From the command line
```
cd path_to_unzipped_directory
R CMD INSTALL %1$s
```

- Or from within R
```
setwd('path_to_unzipped_directory')
install.packages('%1$s', repos=NULL, type='SOURCE')
```

### Source
This package was derived from the
[BioCro skeleton module library](https://github.com/biocro/skelBML). See
`DESCRIPTION_skeleton` for more information about the version of the skeleton
library that was used.

### License
The `%1$s` R package is licensed under version 2.0 or greater of the
GNU General Public License.
