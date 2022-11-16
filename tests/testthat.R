# Load the BioCro framework and the testing package
library(testthat)
library(BioCro)

# Load this package and test it
source('PACKAGE_NAME.R') # should define a string called PACKAGE_NAME
library(PACKAGE_NAME, character.only=TRUE)
test_check(PACKAGE_NAME)
