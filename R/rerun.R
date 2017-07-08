#' Title
#'
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
init_rerun <- function(...){
  dots <- list(...)
  .fcuk <<- structure(dots, class = "fcuk")
}


#' Title
#'
#' @param x 
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
print.fcuk <- function(x,...){
  rstudioapi::sendToConsole("voici_une_instruction_a_lancer",execute = FALSE)
}