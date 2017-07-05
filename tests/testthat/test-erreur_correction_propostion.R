context("erreur_correction_propostion")

test_that("erreur_correction_propostion works", {
  expect_equal(erreur_correction_propostion("view")[1],"View")
  expect_equal(erreur_correction_propostion("sl")[1],"ls")
})
