# Tests for get_all_objects_from_r function

test_that("get_all_objects_from_r returns character vector", {
  result <- get_all_objects_from_r()
  expect_type(result, "character")
  expect_gt(length(result), 0)
})

test_that("get_all_objects_from_r includes base functions", {
  result <- get_all_objects_from_r()
  expect_true("mean" %in% result)
  expect_true("sum" %in% result)
})

test_that("get_all_objects_from_r caching works", {
  # First call
  result1 <- get_all_objects_from_r(use_cache = TRUE)
  # Second call should use cache
  result2 <- get_all_objects_from_r(use_cache = TRUE)
  expect_equal(result1, result2)
})

test_that("deprecated get_all_objets_from_r still works", {
  expect_warning(
    result <- get_all_objets_from_r(),
    "deprecated"
  )
  expect_type(result, "character")
})
