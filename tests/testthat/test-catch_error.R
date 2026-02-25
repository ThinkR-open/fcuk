# Tests for catch_error function

test_that("catch_error extracts object names from error messages", {
  errors <- fcuk:::regex_rules()$error
  extracted <- vapply(errors, catch_error, character(1), USE.NAMES = FALSE)
  unique_extracted <- unique(extracted)

  expect_true(setequal(unique_extracted, c("sl", "iri", "dplir")))
})

test_that("catch_error returns empty character for non-matching messages", {
  result <- catch_error("This is not an error message")
  expect_length(result, 0)
})

test_that("catch_error handles empty input", {
  result <- catch_error("")
  expect_length(result, 0)
})

test_that("catch_error works with English error message", {
  result <- catch_error("Error: object 'myvar' not found\n")
  expect_equal(result, "myvar")
})

test_that("catch_error works with French error message", {
  result <- catch_error("Error in try(iri) : objet 'iri' introuvable\n")
  expect_equal(result, "iri")
})
