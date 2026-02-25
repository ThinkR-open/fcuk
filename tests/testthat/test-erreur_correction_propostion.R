# Tests for error_correction_propostion function

test_that("error_correction_propostion suggests correct alternatives", {
  expect_equal(error_correction_propostion("view")[1], "View")
  expect_equal(error_correction_propostion("sl")[1], "ls")
})

test_that("error_correction_propostion returns requested number of suggestions", {
  result <- error_correction_propostion("iri", n = 3)
  expect_length(result, 3)
})

test_that("error_correction_propostion handles invalid input", {
  expect_length(error_correction_propostion(NULL), 0)
  expect_length(error_correction_propostion(character(0)), 0)
  expect_length(error_correction_propostion(123), 0)
})

test_that("error_correction_propostion handles invalid n", {
  expect_length(error_correction_propostion("view", n = -1), 0)
  expect_length(error_correction_propostion("view", n = "a"), 0)
})
