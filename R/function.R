#' extract all object from r
#'
#' fetch all r loaded objects
#' @param ... not used
#' @export
#'
#' @examples
#' get_all_objets_from_r()
get_all_objets_from_r <- function(...) {
  unname(unlist(sapply(search(), function(x) {
    ls(x)
  })))
}

#' Find closest R functions
#'
#' @param car error to check
#' @param method Method for distance calculation. The default is "jaccard", see \link[stringdist]{stringdist-metrics}.
#'
#' @export
#' @import stringdist

erreur_correction_propostion <- function(car, method = "jaccard") {
  candidats <- get_all_objets_from_r()
  candidats[order(stringdist(tolower(car), tolower(candidats), method = method))][1:2]
}




#' Error Analysis
#'
#' @param error error to check
#'
#' @export
#'
error_analysis <- function(error = catch_error()) {
  if (!is.na(error)) {
    # message(gettext("You ask :"), deparse(error), "\n")
    cat(
      gettext("Maybe you mean :"),
      paste(
        erreur_correction_propostion(as.character(error)[1]),
        collapse = gettext(" or ")
      )
      ,
      "?\n"
    )
  }
}


#' capture and parse the last error
#'
#' @param sentense
#'
#' @export
catch_error <- function(sentence = geterrmessage()) {
  a1 <- sub(".*'(.*)' not found.*", "\\1", sentence)
  a2 <- sub(".*could not find function \"(.*)\"\n", "\\1", sentence)
  res <- c(a1, a2)
  res[res != sentence][1]
  
}

#' init error tracker
#'
#' @export
#'
init_error_tracker <- function(){
  
  options("old_error" = getOption("error"))
    options( error = function(...){ 
       error_analysis() }  )
  }



#' Remove error tracker
#'
#' @export
#'
remove_error_tracker <- function() {

  options("error" = getOption("old_error"))
  
}