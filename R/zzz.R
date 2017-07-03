#' @noRd
.onAttach <- function(libname, pkgname) {
  fcuk::init_error_tracker()
}
#' @noRd
.onDetach <- function(libname, pkgname) {
  fcuk::remove_error_tracker()
}
