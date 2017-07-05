context("error_analysis")

test_that("fcuk::error_analysis works", {
  expect_match(error_analysis("iri"),"iris")
  expect_match(error_analysis("dplir"),"dplyr")
})
