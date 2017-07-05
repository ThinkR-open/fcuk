context("regex")

test_that("regex ok ", {
  library(purrr)
  hop <- c()
  for ( sentence in fcuk:::regex_rules()$error){
   hop <- c(hop, fcuk:::regex_rules()$regex %>% 
      map_chr(~sub(.x,"\\1",sentence)) %>%
      unname() %>%
      .[. != sentence] )
  }
expect_true(setequal(sort(unique(hop)),c("dplir","iri","sl")))
})
