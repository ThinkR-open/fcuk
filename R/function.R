#' Extract the name of all objects loaded in the R environments 
#'
#' Fetch the name of all objects loaded in the environments (functions, values, data...)
#'
#' @return a list with the names of all objects contained in the environments
#' @export
#' @importFrom purrr map flatten_chr
#' @importFrom magrittr %>% 
#' @examples
#' get_all_objets_from_r()
get_all_objets_from_r <- function() {
  search() %>% 
    map(ls,all.names = TRUE) %>% 
    flatten_chr()
}

#' Find closest object names 
#' 
#' Analyse a typo and suggests the two closest names. 
#'
#' @param asked_objet the R name producing an error
#' @param method Method for distance calculation. The default is "jaccard", see \link[stringdist]{stringdist-metrics}.
#' @param n number of corrections to suggest.
#' @return a character vector with the closest neighbors
#' @export
#' @import stringdist
#' @examples 
#' error_correction_propostion("iri")

error_correction_propostion <- function(asked_objet, method = "jaccard",n=2) {
  candidats <- get_all_objets_from_r()
  candidats[order(stringdist(tolower(asked_objet), tolower(candidats), method = method))][seq_len(n)]
}




#' Error Analysis
#'
#' @param asked_objet the name to analyse
#' @param n number of names to suggest 
#'
#' @export
#' @examples 
#' fcuk::error_analysis() #last error is analysed
#' fcuk::error_analysis("view")
#' fcuk::error_analysis("iri")
error_analysis <- function(asked_objet = catch_error(),n=2) {

    if (length(asked_objet)>0 && !is.na(asked_objet)) {
    # message(gettext("You ask :"), deparse(asked_objet), "\n")
    cat(
      gettext("Did you mean :"),
      out <- paste(
        error_correction_propostion(as.character(asked_objet)[1],n=n),
        collapse = gettext(" or ")
      )
      ,
      "?\n"
    )
  }
invisible(out)
  }


#' Capture and parse an error message.
#'
#' @param sentence an error message to parse
#' @importFrom purrr map_chr
#' @export
#' @examples 
#' catch_error()
#' catch_error("Error: object 'iri' not found\n")
#' catch_error("Error: object 'view' not found\n")
#' 
#' 
catch_error <- function(sentence = geterrmessage()) {
  regex_rules()$regex %>% 
    map_chr(~sub(.x,"\\1",sentence)) %>%
    # unname() %>% 
    .[. != sentence]
}

#' Init error tracker
#' 
#' After lauching this function, every error message will be analysed.
#' This function is called when loading the package. 
#'
#' @export
#' @examples 
#' getOption("error")
#' fcuk::init_error_tracker()
#' getOption("error")
init_error_tracker <- function(){
  
  options("old_error" = getOption("error"))
  options( error = function(...){ 
    fcuk::error_analysis()
    # .rs.breakOnError(TRUE)
    
  }  )
}



#' Remove error tracker
#' 
#' After lauching this function, the errors will no longer be analysed.
#'
#' @export
#' @examples 
#' getOption("error")
#' fcuk::remove_error_tracker()
#' getOption("error")
remove_error_tracker <- function() {
  options("error" = getOption("old_error"))
}



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


