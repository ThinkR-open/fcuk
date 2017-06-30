library(prenoms)
library(stringr)
library(dplyr)
data(prenoms, package = "prenoms")
nombre_voyelle <-
  function(nom) {
    str_locate_all(iconv(to = "ASCII//TRANSLIT", nom), "[aeiouy]") %>% sapply(FUN = nrow)
  }
data_frame(nom,
           ratio = nombre_voyelle(nom) / str_count(nom)) %>%
  arrange(ratio)

prenoms %>%
  mutate(ratio = voyelle_consonne(name)) %>% arrange(ratio)
