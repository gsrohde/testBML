# When creating a new BioCro module library R package, it will be necessary to
# modify the package name in the following commands. For example, if the new
# package is to be called `myLib`, `library(skelBML)` should be replaced with
# `library(myLib)` and `test_check("skelBML")` should be replaced with
# `test_check("myLib")`.

library(testthat)
library(BioCro)
library(skelBML)

test_check("skelBML")
