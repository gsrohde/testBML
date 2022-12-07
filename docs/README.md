## skelBML
This repository contains a **skel**eton **B**ioCro **m**odule **l**ibrary
(`skelBML`), which is an R package representing a BioCro module library with a
single example module. The `skelBML` repository is designed to be used as a base
for other BioCro module libraries.

### Using this repository to initialize a working module library

By default, the code here will not compile and does not define a functional R
package. Instead, the following steps should be taken to initialize a working R
packge:
1. Make a fork of this repository.
2. Obtain a local copy. This repository (and your newly-created fork) contains a
   git submodule, so the "Download ZIP" option from the GutHub website will not
   work properly. Instead, the easiest way to get a local copy is to install
   GitHub Desktop and use the "Open with GitHub Desktop" option from the GitHub
   website. Alternatively, if you are familiar with command-line git, you can
   clone the repository as usual and then use `git submodule update --init` to
   get the submodule code.
3. Run the startup script, which can be accomplished using either of two
   methods:
   1. Open an R session, set the working directory to `script`, and type
      `source('module_library_setup.R')`.
   2. From a terminal running in the `script` directory, type
      `Rscript module_library_setup.R`.

   In either case, you will be prompted for a module library name, which should
   be 16 or fewer characters long and not contain any underscores; ideally this
   would be the name of the new forked repository. This script will generate
   several files that are required to complete the package.
5. To confirm that everything worked, try building and checking the new
   package with `R CMD build` and `R CMD check`.
6. Commit the changed files to your new repository.

### Customizing your new module library

Now you are ready to start adding new modules to the package! Adding new modules
requires the addition of new module classes in the `src/module_library`
directory, and modifications to the `#include` directives and table in
`src/module_library/module_library.cpp`.

You may also want to update `README.md`, `NEWS.md`, and `DESCRIPTION` to include
information about your new module library and its authors. If you wish to use a
different license for distributing your package, you will need to modify
`LICENSE.md`, `DESCRIPTION`, and `README.md`.

For an example of a module library R package that was derived from the skeleton
module library, please see the [crop growth BioCro module library](https://github.com/biocro/cgbml).

While working on your module library, please avoid modifying the following
files; doing so may cause merge conflicts in the future when updating your fork
from the skeleton module library:
- Any files directly in the `src` directory.
- Any files in the `src/framework` directory.
- Any files describing the skeleton module library: `docs/README.md`,
  `NEWS_skeleton.md`, and `DESCRIPTION_skeleton`.
- Any files in the `script` directory.

### Updating your module library

The BioCro development team may make changes to the skeleton module library in
the future; every effort will be made to limit the frequency of these updates,
but they will nevertheless occur. When there is an update to this repository,
you can update your module library by taking the following steps:
1. Make a new "development" branch for your repository (based on the main
   branch).
2. The GitHub web interface has a "Sync fork" button, but it cannot be used if
   there are any conflicts between your repository and `skelBML`. Unfortunately,
   this will almost always be the case when updating your repository. Instead,
   you can sync your branch to `skelBML` using command-line git as follows
   (assuming you have checked out the new development branch on your local
   machine):
   ```
   git fetch upstream
   git merge upstream/main
   ```
   You will probably need to address one or more merge conflicts at this point.
3. Check `NEWS_skeleton.md` to see if the new version of the skeleton module
   library requires you to rerun the startup script; if it does, then take the
   following steps:
   1. Rerun the startup script, as described above.
   2. Any files that would be changed by the script will be backed up; for
      example, if the script would modify
      `src/module_library/module_library.cpp`, it will first store the contents
      of the original file in a new file called something like
      `src/module_library\module_library.cpp-36185ed74f94.bak` (where
      `36185ed74f94` is a randomly generated alphanumeric string).
   3. For any files with corresponding `.bak` versions, check for important
      customizations that should be retained in the new version of those files,
      such as the table of modules, the package title, etc. Delete backups as
      you see fit.
4. To confirm that everything worked, try building and checking the package on
   the development branch with `R CMD build` and `R CMD check`.
5. When everything is working, commit the changed files to the development
   branch, and then merge the branch into the main branch of your repository
   (ideally by first creating a pull request).

Updating your repository on a development branch as described in these steps
will allow you to test out the changes before committing them to your main
branch.

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
