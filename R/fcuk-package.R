#' fcuk: The Ultimate Helper for Clumsy Fingers
#'
#' The fcuk package automatically suggests corrections when a typo occurs
#' in R code. It intercepts error messages and provides helpful suggestions
#' based on string distance algorithms.
#'
#' @section Main Features:
#' \itemize{
#'   \item Automatic error interception and correction suggestions
#'   \item Support for multiple languages (English, French, German, Spanish, etc.)
#'   \item Quick rerun with `.+1` operator to apply suggested corrections
#'   \item Caching for improved performance
#' }
#'
#' @section Getting Started:
#' The package is automatically activated when loaded with `library(fcuk)`.
#' When an error occurs, fcuk will suggest corrections. Use `.+1` to apply
#' the first suggestion, or `.+2` for the second.
#'
#' @section Functions:
#' \itemize{
#'   \item [error_analysis()]: Analyse an error and suggest corrections
#'   \item [catch_error()]: Extract object name from error message
#'   \item [error_correction_propostion()]: Find closest matching names
#'   \item [get_all_objects_from_r()]: Get all available object names
#'   \item [init_error_tracker()]: Enable automatic error tracking
#'   \item [remove_error_tracker()]: Disable automatic error tracking
#'   \item [add_fcuk_to_rprofile()]: Add fcuk to your .Rprofile
#' }
#'
#' @docType package
#' @name fcuk-package
#' @aliases fcuk
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
