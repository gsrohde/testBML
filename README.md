## skelBML
This repository contains a **skel**eton **B**ioCro **m**odule **l**ibrary
(skelBML), which is an R package representing a BioCro module library with a
single example module. The skelBML repository is designed to be used as a base
for other BioCro module libraries.

### Installation

#### Requirements
- The [R environment](https://cran.r-project.org/).
- On Windows, a version of [Rtools](https://cran.r-project.org/bin/windows/Rtools/)
  appropriate for your version of R.
- On Linux, gcc and g++ version 4.9.3 or greater (consult documentation for your
  distribution for installation instructions).
- On MacOS, Xcode.

#### Installation steps
Download the source code from GitHub, unzip the file, and install from the
either the command line or from within R using one of the following sets of
commands. These assume that the source files are in a directory named "skelBML".

- From the command line
```
cd path_to_unzipped_directory
R CMD INSTALL skelBML
```

- Or from within R
```
setwd('path_to_unzipped_directory')
install.packages('skelBML', repos=NULL, type='SOURCE')
```

### Creating a new module library
To use the skeleton module library for creating a new module library, follow
these steps:
- Choose a name for your new module library, such as `myLib`. If you plan on
  submitting your library to CRAN, choose a name with seven or fewer characters.
  Otherwise, some of the boost-related file paths will exceed 100 characters,
  which is not allowed when submitting to CRAN.
- Fork the `skelBML` repository to a new one with the same name as your module
  library. In the following instructions, we will assume the new module library
  is to be called `myLib`.
- In the `DESCRIPTION` file, change the name of the package to `myLib` and reset
  the version number to `1.0.0`. It's also a good idea to update the `Title`,
  `Description`, and `URL` fields. You may need to add authors and change the
  package maintainer.
- In the `NAMESPACE` file, change the name of the dynamic library to `myLib`.
- Update this file (`README.md`) with information about your new package. Make
  sure to change the package name in the installation instructions and the
  license information. It is also a good idea to remove this section ("Creating
  a new module library") since these instructions are specific to the skeleton
  module library.
- Initialize `NEWS.md` with information about version `1.0.0` of `myLib`.
- There are several other places in the source code where `skelBML` or `SKELBML`
  must be replaced by the name of your library, occasionally in all capital
  letters. The following files have additional instructions for doing this:
    - `src/init.cpp`
    - `src/module_library/module_library.h`
    - `src/module_library/module_library.cpp`
    - `src/module_librar/example_module.h`
    - `src/R_module_library.cpp`
- There are several places in the testing code where `skelBML` must be replaced
  by the name of your library. The following files have additional instructions
  for doing this:
    - `tests/testthat/test.Modules.R`
    - `tests/testthat.R`
    - `tests/module_test_cases/skelBML_example_module.csv` (must be renamed to
      `tests/module_test_cases/myLib_example_module.csv`)
- At this point, it is a good idea to use `R CMD build` and `R CMD check` to
  confirm that your new R package is functioning. If it passes the checks, then
  you can begin populating the library with your new modules.
- An example demonstrating all of the above steps can be found in the crop
  growth BioCro module library, which is a fork of this repository:
  https://github.com/biocro/cgbml/pull/1.
- Occasionally there will be updates to the skelBML repository. Since these may
  cause merge conflicts with modified files in module libraries that are forked
  from this one, every attempt will be made to avoid changes in any of these
  files that must be modified.
- As your module library grows, you may wish to add automated GitHub workflows
  and additional information such as vignettes or Doxygen documentation. For an
  example, please see the standard BioCro module library repository. (Not yet
  available.)

### Making contributions
Please see the
[contribution guidelines](https://github.com/ebimodeling/biocro/blob/main/developer_documentation/contribution_guidelines.md)
before submitting changes.

### Software Documentation

See the
[BioCro Documentation website](https://ebimodeling.github.io/biocro-documentation/),
which includes documentation for the C++ framework, the BioCro R package, and
the standard module library.

### License

The skelBML R package is licensed under version 2.0 or greater of the GNU
General Public License.
