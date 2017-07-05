
#' @noRd
.onAttach <- function(libname, pkgname) {
  get("attach")( new.env(), name = "fcuk_shims", pos = 2 )
  fcuk::init_error_tracker()
}
#' @noRd
.onDetach <- function(libname) {
  get("detach")( "fcuk_shims" )
  fcuk::remove_error_tracker()
}
