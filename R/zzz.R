#' @importFrom utils packageDescription
#' @noRd
.onAttach <- function(libname, pkgname) {
  fcuk::init_error_tracker()
}
