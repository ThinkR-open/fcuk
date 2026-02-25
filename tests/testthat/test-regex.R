# Tests for regex_rules function

test_that("regex rules extract correct names from all error types", {
  rules <- fcuk:::regex_rules()
  errors <- rules$error
  patterns <- rules$regex

  extracted <- character(0)
  for (sentence in errors) {
    matches <- vapply(
      patterns,
      function(pattern) sub(pattern, "\\1", sentence),
      character(1)
    )
    extracted <- c(extracted, matches[matches != sentence])
  }

  expect_true(setequal(sort(unique(extracted)), c("dplir", "iri", "sl")))
})

test_that("regex_rules returns data frame with correct structure", {
  rules <- fcuk:::regex_rules()
  expect_s3_class(rules, "data.frame")
  expect_true("error" %in% names(rules))
  expect_true("regex" %in% names(rules))
})

test_that("regex_rules has same number of errors and patterns", {
  rules <- fcuk:::regex_rules()
  expect_equal(nrow(rules), length(rules$regex))
  expect_equal(length(rules$error), length(rules$regex))
})
