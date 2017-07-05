context("catch_error")

test_that("catch_error works", {
  library(purrr)
  out <- fcuk:::regex_rules()$error %>% 
    map_chr(~catch_error(.x)) %>% 
    unique()
  
  expect_equal(out, c("sl","iri","dplir"))
})
