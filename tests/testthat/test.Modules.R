context("Run test cases for all modules")

# Test all the modules in the library, with a few exceptions
modules_to_skip <- c(
    # No need to skip any modules in this library
)

# When creating a new BioCro module library R package, it will be necessary to
# modify the library name in the following command. For example, if the new
# package is to be called `myLib`, the first argument to `test_module_library`
# should become `myLib`.
test_that("All modules are functioning correctly", {
    expect_error(
        test_module_library(
            'skelBML',
            file.path('..', 'module_test_cases'),
            modules_to_skip
        ),
        regexp = NA
    )
})
