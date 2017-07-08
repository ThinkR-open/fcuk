
#' @noRd
#' @importFrom tibble tribble
regex_rules <- function(){
  res <- tribble( ~error,~regex,
                  "Error in sl() : \"sl\" fonksiyonu bulunamadi\n" ,".*\"(.*)\" fonksiyonu bulunamadi\n",
                  "Error in sl() : could not find function \"sl\"\n" ,    ".*could not find function \"(.*)\"\n",
                  "Error in sl() : fann ikkje funksjonen \u00ABsl\u00BB\n" ,    ".*fann ikkje funksjonen \u00AB(.*)\u00BB\n",
                  "Error in sl() : impossible de trouver la fonction \"sl\"\n" ,    ".*impossible de trouver la fonction \"(.*)\"\n",
                  "Error in sl() : konnte Funktion \"sl\" nicht finden\n" ,     ".*konnte Funktion \"(.*)\" nicht finden\n",
                  "Error in sl() : n\u00E3o foi poss\u00EDvel encontrar a fun\u00E7\u00E3o \"sl\"\n" ,     ".*n\u00E3o foi poss\u00EDvel encontrar a fun\u00E7\u00E3o \"(.*)\"\n",
                  "Error in sl() : nie udalo sie znalezc funkcji 'sl'\n" ,    ".*nie udalo sie znalezc funkcji '(.*)'\n",
                  "Error in sl() : no se pudo encontrar la funci\u00F3n \"sl\"\n" ,    ".*no se pudo encontrar la funci\u00F3n \"(.*)\"\n",
                  "Error in sl() : non trovo la funzione \"sl\"\n" ,    ".*non trovo la funzione \"(.*)\"\n",
                  "Error in try(iri) : 'iri' nesnesi bulunamadi\n" ,    ".*'(.*)' nesnesi bulunamadi.*",
                  "Error in try(iri) : fann ikkje objektet \u00ABiri\u00BB\n" ,     ".*fann ikkje objektet \u00AB(.*)\u00BB.*",
                  "Error in try(iri) : nie znaleziono obiektu 'iri'\n" ,    ".*nie znaleziono obiektu '(.*)'.*",
                  "Error in try(iri) : object 'iri' not found\n" ,    ".*'(.*)' not found.*",
                  "Error in try(iri) : object \u0091iri\u0092 not found\n" ,    ".*\u0091(.*)\u0092 not found.*",
                  "Error in try(iri) : objekt 'iri' blev ikke fundet\n" ,    ".*'(.*)' blev ikke fundet.*",
                  "Error in try(iri) : Objekt 'iri' nicht gefunden\n" ,     ".*'(.*)' nicht gefunden.*",
                  "Error in try(iri) : objet 'iri' introuvable\n" ,    ".*'(.*)' introuvable.*",
                  "Error in try(iri) : objeto 'iri' n\u00E3o encontrado\n" ,     ".*'(.*)' n\u00E3o encontrado.*",
                  "Error in try(iri) : objeto 'iri' no encontrado\n" ,     ".*'(.*)' no encontrado.*",
                  "Error in try(iri) : oggetto \"iri\" non trovato\n" ,    ".*\"(.*)\" non trovato.*",
                  "Error in library(dplir) :" ,     "Error in library\\(\"(.*)\"\\) :.*",
                  "Error in library(dplir) :" ,     "Error in library\\('(.*)'\\) :.*",
                  "Error in library(dplir) :" ,     "Error in library\\((.*)\\) :.*"
  )
  
  
  res
}
