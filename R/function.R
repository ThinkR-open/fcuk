#' Extract the name of all objects loaded in the R environments 
#'
#' Fetch the name of all objects loaded in the environments (functions, values, data...)
#'
#' @return a list with the names of all objects contained in the environments
#' @export
#' @importFrom purrr map flatten_chr
#' @importFrom utils installed.packages
#' @importFrom magrittr %>% 
#' @examples
#' get_all_objets_from_r()
get_all_objets_from_r <- function() {
  search()[10] %>% 
    map(ls, all.names = TRUE) %>% 
    flatten_chr() %>% 
    map(~{if("data.frame" %in% class(get(.x))){c(.x, names(get(.x)))}else{.x}}) %>% 
    flatten_chr() %>% c(installed.packages() %>% rownames())
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
# browser()
    if (length(asked_objet)>0 && !is.na(asked_objet)) {
    # message(gettext("You ask :"), deparse(asked_objet), "\n")
    cat(
      gettext("Did you mean :"),
      out <- paste(
        corr <- error_correction_propostion(as.character(asked_objet)[1],n=n),
        collapse = gettext(" or ")
      )
      ,
      "?\n"
    )
      
      init_rerun(corr,geterrmessage(),asked_objet)
      
invisible(out)
}
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




