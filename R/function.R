#' Extract all loaded objects names from R environments 
#'
#' fetch all R loaded objects names (functions, values, data...)
#' @param ... not used
#' @export
#' @importFrom purrr map 
#' @importFrom magrittr %>% 
#' @examples
#' get_all_objets_from_r()
get_all_objets_from_r <- function(...) {
  search() %>% 
    purrr::map(~ls(.x)) %>% 
    unlist %>%
    unname()
}

#' Find closest R functions names
#'
#' @param asked_objet the R object name producing an error
#' @param method Method for distance calculation. The default is "jaccard", see \link[stringdist]{stringdist-metrics}.
#' @param n number of names corrections to suggest
#'
#' @export
#' @import stringdist
#' @examples 
#' erreur_correction_propostion("iri")

erreur_correction_propostion <- function(asked_objet, method = "jaccard",n=2) {
  candidats <- get_all_objets_from_r()
  candidats[order(stringdist(tolower(asked_objet), tolower(candidats), method = method))][seq_len(n)]
}




#' Error Analysis
#'
#' @param asked_objet the R object name producing an error
#' @param n number of corrections to suggest
#'
#' @export
#' @examples 
#' fcuk::error_analysis() #last error is analysed
#' fcuk::error_analysis("view")
#' fcuk::error_analysis("iri")
error_analysis <- function(asked_objet = catch_error(),n=2) {
  if (!is.na(asked_objet)) {
    # message(gettext("You ask :"), deparse(asked_objet), "\n")
    cat(
      gettext("Maybe you mean :"),
      paste(
        erreur_correction_propostion(as.character(asked_objet)[1],n=n),
        collapse = gettext(" or ")
      )
      ,
      "?\n"
    )
  }
}


#' Capture and parse the last error
#'
#' @param sentence an error message to parse
#' @export
#' @examples 
#' catch_error()
#' catch_error("Error: object 'iri' not found\n")
#' catch_error("Error: object 'view' not found\n")
catch_error <- function(sentence = geterrmessage()) {
  a1 <- sub(".*'(.*)' not found.*", "\\1", sentence)
  a2 <- sub(".*'(.*)' introuvable.*", "\\1", sentence)
  a3 <- sub(".*could not find function \"(.*)\"\n", "\\1", sentence)
  a4 <- sub(".*impossible de trouver la fonction \"(.*)\"\n", "\\1", sentence)
  
  res <- c(a1, a2,a3,a4)
  res[res != sentence][1]
}

#' Init error tracker
#' 
#' each error message will be analysed
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
#' @export
#' @examples 
#' getOption("error")
#' fcuk::remove_error_tracker()
#' getOption("error")
remove_error_tracker <- function() {
  options("error" = getOption("old_error"))
}
