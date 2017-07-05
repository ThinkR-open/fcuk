context("error_correction_propostion")

test_that("error_correction_propostion works", {
  expect_equal(error_correction_propostion("view")[1],"View")
  expect_equal(error_correction_propostion("sl")[1],"ls")
})
