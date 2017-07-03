#' @importFrom utils packageDescription
#' @noRd
.onAttach <- function(libname, pkgname) {
  if (interactive()) {
    options( error = function(...){ 
      error_analysis() }  )
  }
}
