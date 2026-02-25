# Tests for error_analysis function

test_that("error_analysis suggests iris for iri", {
  result <- error_analysis("iri")
  expect_match(result, "iris")
})

test_that("error_analysis returns NULL for empty input", {
  result <- error_analysis(character(0))
  expect_null(result)
})

test_that("error_analysis returns NULL for NA input", {
  result <- error_analysis(NA)
  expect_null(result)
})
