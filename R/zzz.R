#' @noRd
.onAttach <- function(libname, pkgname) {
  fcuk::init_error_tracker()
}
#' @noRd
.onDetach <- function(libname) {
  fcuk::remove_error_tracker()
}

globalVariables(".")