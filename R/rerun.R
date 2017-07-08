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
  options(fcuk=dots)
}

#' @export
. <- structure("", class= "fcuk")


#' Title
#'
#' @param x 
#' @param y 
#'
#' @return
#' @export
#' @importFrom rstudioapi sendToConsole
#' @examples
`+.fcuk` <- function(x, y){  
  
message(x)
message(y)
rstudioapi::sendToConsole("voici_une_instruction_a_lancer",execute = FALSE)

  
  }

