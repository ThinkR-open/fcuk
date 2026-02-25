#' @noRd
.onAttach <- function(libname, pkgname) {
  # Check for existing error handler

  old_handler <- getOption("error")

  if (!is.null(old_handler) && !identical(old_handler, quote(NULL))) {
    packageStartupMessage(
      "Note: An error handler was already set. ",
      "fcuk will override it. Use remove_error_tracker() to restore."
    )
  }

  # Initialize error tracking
  fcuk::init_error_tracker()

  packageStartupMessage(
    "fcuk loaded. Error suggestions enabled. ",
    "Type .+1 to apply first suggestion."
  )
}

#' @noRd
.onDetach <- function(libname) {
  fcuk::remove_error_tracker()
}

# Declare global variables to avoid R CMD check notes
globalVariables(".")
