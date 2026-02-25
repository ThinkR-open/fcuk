#' Get regex rules for error parsing
#'
#' Returns a data frame with error patterns and corresponding regex rules
#' for extracting object/function names from error messages in multiple languages.
#'
#' @return A data frame with columns `error` (example error) and `regex` (pattern).
#' @noRd
regex_rules <- function() {
  data.frame(
    error = c(
      # Function not found errors
      "Error in sl() : \"sl\" fonksiyonu bulunamadi\n",
      "Error in sl() : could not find function \"sl\"\n",
      "Error in sl() : fann ikkje funksjonen \u00ABsl\u00BB\n",
      "Error in sl() : impossible de trouver la fonction \"sl\"\n",
      "Error in sl() : konnte Funktion \"sl\" nicht finden\n",
      "Error in sl() : n\u00E3o foi poss\u00EDvel encontrar a fun\u00E7\u00E3o \"sl\"\n",
      "Error in sl() : nie udalo sie znalezc funkcji 'sl'\n",
      "Error in sl() : no se pudo encontrar la funci\u00F3n \"sl\"\n",
      "Error in sl() : non trovo la funzione \"sl\"\n",
      # Object not found errors
      "Error in try(iri) : 'iri' nesnesi bulunamadi\n",
      "Error in try(iri) : fann ikkje objektet \u00ABiri\u00BB\n",
      "Error in try(iri) : nie znaleziono obiektu 'iri'\n",
      "Error in try(iri) : object 'iri' not found\n",
      "Error in try(iri) : object \u0091iri\u0092 not found\n",
      "Error in try(iri) : objekt 'iri' blev ikke fundet\n",
      "Error in try(iri) : Objekt 'iri' nicht gefunden\n",
      "Error in try(iri) : objet 'iri' introuvable\n",
      "Error in try(iri) : objeto 'iri' n\u00E3o encontrado\n",
      "Error in try(iri) : objeto 'iri' no encontrado\n",
      "Error in try(iri) : oggetto \"iri\" non trovato\n",
      # Library errors
      "Error in library(dplir) :",
      "Error in library(dplir) :",
      "Error in library(dplir) :"
    ),
    regex = c(
      # Function not found patterns
      ".*\"(.*)\" fonksiyonu bulunamadi\n",
      ".*could not find function \"(.*)\"\n",
      ".*fann ikkje funksjonen \u00AB(.*)\u00BB\n",
      ".*impossible de trouver la fonction \"(.*)\"\n",
      ".*konnte Funktion \"(.*)\" nicht finden\n",
      ".*n\u00E3o foi poss\u00EDvel encontrar a fun\u00E7\u00E3o \"(.*)\"\n",
      ".*nie udalo sie znalezc funkcji '(.*)'\n",
      ".*no se pudo encontrar la funci\u00F3n \"(.*)\"\n",
      ".*non trovo la funzione \"(.*)\"\n",
      # Object not found patterns
      ".*'(.*)' nesnesi bulunamadi.*",
      ".*fann ikkje objektet \u00AB(.*)\u00BB.*",
      ".*nie znaleziono obiektu '(.*)'.*",
      ".*'(.*)' not found.*",
      ".*\u0091(.*)\u0092 not found.*",
      ".*'(.*)' blev ikke fundet.*",
      ".*'(.*)' nicht gefunden.*",
      ".*'(.*)' introuvable.*",
      ".*'(.*)' n\u00E3o encontrado.*",
      ".*'(.*)' no encontrado.*",
      ".*\"(.*)\" non trovato.*",
      # Library patterns
      "Error in library\\(\"(.*)\"\\) :.*",
      "Error in library\\('(.*)'\\) :.*",
      "Error in library\\((.*)\\) :.*"
    ),
    stringsAsFactors = FALSE
  )
}
