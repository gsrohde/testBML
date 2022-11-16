# To use this script, open an R session, ensure the working directory is set to
# the directory that contains this script, and type the following command:
# source('module_library_setup.R')

################################################################################

# Ask for the name of the package
cat('Please enter a name for the module library R package:\n')
package_name <- readline()

# Trim any white space
package_name <- trimws(package_name)

# Make sure the length is okay
if (nchar(package_name) < 1) {
    stop("Package name must have at least one character")
} else if (nchar(package_name) > 7) {
    msg <- paste(
        "Package names with more than 7 characters will cause issues when",
        "submitting to CRAN.\n",
        "Do you still wish to use this package name?"
    )
    if (!utils::askYesNo(msg)) {
        stop()
    }
}

# Make sure there are no underscores
if (grepl('_', package_name, fixed = TRUE)) {
    stop("Package names cannot contain underscores")
}

# Create a character vector representing the contents of R_PACKAGE_NAME.h
header_file_content <- c(
    "#ifndef R_PACKAGE_NAME",
    paste("    #define R_PACKAGE_NAME", package_name),
    "#endif",
    "",
    "#ifndef R_INIT_FUNC",
    paste0("    #define R_INIT_FUNC R_init_", package_name),
    "#endif"
)

# Create a character vector representing the contents of PACKAGE_NAME.R
r_file_content <- paste0("PACKAGE_NAME <- '", package_name, "'")

# Create a character vector representing the contents of NAMESPACE
namespace_content <- paste0("useDynLib(", package_name, ", .registration = TRUE)")

# Create a character vector representing the contents of DESCRIPTION
description_content <- c(
    paste("Package:", package_name),
    "Version: 1.0.0",
    "Title: YOUR TITLE HERE",
    "Description: YOUR DESCRIPTION HERE",
    "Authors@R: c(",
    "    person('Example', 'McAuthor', role = c('cre', 'aut'),",
    "          email = 'example@illinois.edu')",
    "    )",
    "Imports:",
    "    stats",
    "Suggests:",
    "    BioCro (>= 3.0.0),",
    "    testthat,",
    "    knitr,",
    "    lattice",
    "VignetteBuilder: knitr",
    "SystemRequirements: C++11, GNU make",
    "License: GPL (>= 2)",
    "LazyData: true",
    "ByteCompile: TRUE"
)

# Create a character vector representing the contents of NEWS.md
news_content <- c(
    "<!--",
    "This file should document all pull requests and all user-visible changes.",
    "",
    "When a pull request is completed, changes made should be added to a section at",
    "the top of this file called '# UNRELEASED'. All changes should be categorized",
    "under '## MAJOR CHANGES', '## MINOR CHANGES', or '## BUG FIXES' following the",
    "major.minor.patch structure of semantic versioning. When applicable, entries",
    "should include direct links to the relevant pull requests.",
    "",
    "Then, when a new release is made, '# UNRELEASED' should be replaced by a heading",
    paste("with the new version number, such as '# CHANGES IN", package_name, "VERSION 2.0.0.'"),
    "This section will combine all of the release notes from all of the pull requests",
    "merged in since the previous release.",
    "",
    "Subsequent commits will then include a new 'UNRELEASED' section in preparation",
    "for the next release.",
    "-->",
    "",
    "# UNRELEASED",
    "",
    paste("#", package_name, "VERSION 1.0.0"),
    "",
    "- This is the initial release of the package."
)

# Create a character vector representing the contents of README.md
readme_content <- c(
    paste("##", package_name),
    "PUT AN OVERVIEW OF THE MODULE LIBRARY HERE",
    "",
    "### Installation",
    "",
    "#### Requirements",
    "- The [R environment](https://cran.r-project.org/).",
    "- On Windows, a version of [Rtools](https://cran.r-project.org/bin/windows/Rtools/)",
    "  appropriate for your version of R.",
    "- On Linux, gcc and g++ version 4.9.3 or greater (consult documentation for your",
    "  distribution for installation instructions).",
    "- On MacOS, Xcode.",
    "",
    "#### Installation steps",
    "Download the source code from GitHub, unzip the file, and install from the",
    "either the command line or from within R using one of the following sets of",
    paste0("commands. These assume that the source files are in a directory named '", package_name, "'."),
    "",
    "- From the command line",
    "```",
    "cd path_to_unzipped_directory",
    paste("R CMD INSTALL", package_name),
    "```",
    "",
    "- Or from within R",
    "```",
    "setwd('path_to_unzipped_directory')",
    paste0("install.packages('", package_name, "', repos=NULL, type='SOURCE')"),
    "```",
    "",
    "### License",
    paste0("The `", package_name, "` R package is licensed under version 2.0 or greater of the GNU General Public License.")
)

# Create a character vector representing the content of the module test case file
test_content <- c(
    'input,input,output,output,"description"',
    'A,B,C,D,NA',
    '1,1,2,0.5,"automatically-generated test case"'
)

# Create the files
file_info <- list(
    list(header_file_content, "src/R_PACKAGE_NAME.h"),
    list(r_file_content,      "tests/PACKAGE_NAME.R"),
    list(namespace_content,   "NAMESPACE"),
    list(description_content, "DESCRIPTION"),
    list(news_content,        "NEWS.md"),
    list(readme_content,      "README.md"),
    list(test_content,        paste0("tests/module_test_cases/", package_name, '_example_module.csv'))
)

invisible(lapply(file_info, function(x) {writeLines(x[[1]], x[[2]])}))
