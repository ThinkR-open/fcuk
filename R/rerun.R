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
  
message("x=",x)
message("y=",y)
fcuk <- getOption("fcuk")
message("fcuk"=fcuk)
message(.Last.value)
# browser()
rstudioapi::sendToConsole("ls()",execute = FALSE)

  invisible("")
  }

