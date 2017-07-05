context("get_all_objets_from_r")

test_that("multiplication works", {
  expect_is(get_all_objets_from_r(), "character")
})
