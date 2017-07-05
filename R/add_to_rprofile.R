#' Add library(fcuk) to the .Rprofile file
#' 
#' After calling this function, fcuk will be launched everytime you launch
#' your current R project.
#' 
#' @export
#' @examples
#' fcuk::add_fcuk_to_rprofile()
add_fcuk_to_rprofile <- function(){
  
  if ((file.exists(".Rprofile") &&
      !any(readLines(".Rprofile")=="library(fcuk)"))|!file.exists(".Rprofile")){
      cat("\nlibrary(fcuk)\n",file = ".Rprofile",append = TRUE)
  }
}
