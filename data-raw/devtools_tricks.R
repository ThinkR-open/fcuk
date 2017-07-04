devtools::use_data_raw()
devtools::use_package("stringdist")
devtools::use_package("purrr")
devtools::use_package("magrittr")
devtools::use_vignette("poc")
devtools::build_vignettes()
library(bookdown)
bookdown::render_book("plop")



planet_lookup <- map_chr(sw_planets, "name") %>%
  set_names(map_chr(sw_planets, "url"))
planet_lookup