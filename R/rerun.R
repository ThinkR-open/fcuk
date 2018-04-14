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
#' @importFrom crayon white italic
#' @examples
#' /dontrun{
#' view(iris)# error
#' .+1 # return View(iris)
#' 
#' }
#' 
#' 
`+.fcuk` <- function(x, y){  
  
# message("x=",x)
# message("y=",y)
browser()
# print(get_last(y))
last <- get_last(y)  
  
if (!is.na(last)){
rstudioapi::sendToConsole(last,execute = FALSE)
}else{
  cat(crayon::white$italic("No correction available"))
}
# rstudioapi::sendToConsole("ls()",execute = TRUE)
  cat("")
  blank<-""
  class(blank)<-"blank"
    invisible(blank)

}

#' return corrected instruction
#'
#' @param n number of correction
#'
#' @return
#' @export
#' @examples
#' get_last()
get_last<-function(n=1){
  message <-   getOption("fcuk")[[2]]
  correction <-   getOption("fcuk")[[1]]
  error <-   getOption("fcuk")[[3]]
  le_call <- sub("Error in (.*) :.*" ,"\\1",message)
  # le_call %>%  str_replace(pattern = error,replacement = correction)[n]
  sapply(correction,function(x){gsub(x=le_call,pattern = error,replacement = x)})[n]
}

#'@export
print.blank <-function(x,...){
  cat("")
}