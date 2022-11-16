## skelBML
This repository contains a **skel**eton **B**ioCro **m**odule **l**ibrary
(`skelBML`), which is an R package representing a BioCro module library with a
single example module. The `skelBML` repository is designed to be used as a base
for other BioCro module libraries.

By default, the code here will not compile and does not define a functional R
package. Instead, the following steps should be taken to initialize a working R
packge:
1. Make a fork of this repository.
2. Download a local copy.
3. Open an R session and set the working directory to the directory that
   contains `module_library_setup.R`.
4. Type `source('module_library_setup.R')` to run the module library setup
   script. You will be prompted for a module library name, which should be 7 or
   fewer characters long and not contain any underscores; ideally this would be
   the name of the new forked repository. This script will generate several
   files that are required to complete the package.
5. To confirm that everything worked, try building and checking the new
   package with `R CMD build` and `R CMD check`.
6. Commit the changed files to your new repository.

Now you are ready to start adding new modules to the package! Adding new modules
requires the addition of new module classes in the `src/module_library`
directory, and modifications to the `#include` directives and table in
`src/module_library/module_library.cpp`. Please do not modify any of the files
that are directly in `src`, or in `src/framework`; this may cause merge
conflicts in the future when updating your forked repository from this one.

You may also want to update `README.md`, `NEWS.md`, and `DESCRIPTION` to include
information about the module library. Please do not modify the `skelBML`
versions of these files (`README_skeleton.md`, `NEWS_skeleton.md`, and
`DESCRIPTION_skeleton`). This may cause merge conflicts in the future when
updating your forked repository from this one.

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

The `skelBML` R package is licensed under version 2.0 or greater of the GNU
General Public License.
