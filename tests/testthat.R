# When creating a new BioCro module library R package, it will be necessary to
# modify the package name in the following commands. For example, if the new
# package is to be called `myLib`, the corresponding package should be loaded
# with `library(myLib)` and the package should be checked with
# `test_check('myLib')`.

library(testthat)
library(BioCro)
library(skelBML)

test_check('skelBML')
