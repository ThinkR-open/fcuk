#' Initialize rerun state
#'
#' Store correction information for use with the `.+n` operator.
#'
#' @param ... Correction data to store.
#'
#' @return Invisibly returns `NULL`.
#' @noRd
init_rerun <- function(...) {
  dots <- list(...)
  options(fcuk = dots)
  invisible(NULL)
}


#' Placeholder object for rerun operator
#'
#' Use `.+1` or `.+2` to rerun the last command with a suggested correction.
#'
#' @export
#' @examples
#' \dontrun{
#' view(iris) # error
#' . + 1 # returns View(iris)
#' }
. <- structure("", class = "fcuk")


#' Rerun with correction
#'
#' Use the `+` operator with the `.` object to apply a correction.
#'
#' @param x Blank object of class fcuk.
#' @param y An integer corresponding to the position of the proposal to be reused.
#'
#' @return Invisibly returns a blank object.
#' @export
#' @method + fcuk
#' @examples
#' \dontrun{
#' view(iris) # error
#' . + 1 # returns View(iris)
#' }
`+.fcuk` <- function(x, y) {
  last <- get_last(y)

  if (!is.na(last)) {
    rstudioapi::sendToConsole(last, execute = FALSE)
  } else {
    cli::cli_text(cli::col_silver(cli::style_italic("No correction available")))
  }

  blank <- ""
  class(blank) <- "blank"
  invisible(blank)
}


#' Return corrected instruction
#'
#' Get the corrected command at position `n`.
#'
#' @param n Position of the correction (default: 1).
#'
#' @return A character string with the corrected command, or `NA` if unavailable.
#' @export
#' @examples
#' get_last()
get_last <- function(n = 1) {
  fcuk_data <- getOption("fcuk")

  if (is.null(fcuk_data) || length(fcuk_data) < 3) {
    return(NA_character_)
  }

  message <- fcuk_data[[2]]
  correction <- fcuk_data[[1]]
  error <- fcuk_data[[3]]

  le_call <- sub("Error in (.*) :.*", "\\1", message)

  result <- vapply(
    correction,
    function(x) gsub(x = le_call, pattern = error, replacement = x),
    character(1)
  )

  if (n > length(result) || n < 1) {
    return(NA_character_)
  }

  result[n]
}


#' @export
print.blank <- function(x, ...) {
  invisible(x)
}
