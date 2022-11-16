context("Run test cases for all modules")

source('../PACKAGE_NAME.R')

# Test all the modules in the library, with a few exceptions
modules_to_skip <- c(
    # No need to skip any modules in this library
)

test_that("All modules are functioning correctly", {
    expect_error(
        test_module_library(
            PACKAGE_NAME,
            file.path('..', 'module_test_cases'),
            modules_to_skip
        ),
        regexp = NA
    )
})
