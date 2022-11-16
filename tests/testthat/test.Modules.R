context("Run test cases for all modules")

source('../PACKAGE_NAME.R')

test_that("All modules are functioning correctly", {
    expect_error(
        test_module_library(
            PACKAGE_NAME,
            file.path('..', 'module_test_cases'),
            MODULES_TO_SKIP
        ),
        regexp = NA
    )
})
