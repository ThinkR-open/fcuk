#' Add library(fcuk) to the .Rprofile file
#' 
#' After calling this function, fcuk will be launched everytime you launch
#' your current R project (or any project if you use option `global = TRUE`).
#' 
#' @param global Whether to add it to the global .Rprofile (`TRUE`) or just to 
#'   the  .Rprofile file of your current project (`FALSE`, the default).
#' 
#' @export
#' @examples
#' fcuk::add_fcuk_to_rprofile()
add_fcuk_to_rprofile <- function(global = FALSE) {
  
  file <- `if`(global, "~/.Rprofile", ".Rprofile")
  
  if (file.exists(file)) {
    already_there <- any(grepl("(fcuk)", readLines(file), fixed = TRUE))
    if (already_there) return(invisible(NULL))
  }
  
  to_add <- "\nif (interactive()) {\n  suppressMessages(require(fcuk))\n}\n"
  cat(to_add, file = file, append = TRUE)
}
