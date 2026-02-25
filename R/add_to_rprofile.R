#' Add library(fcuk) to the .Rprofile file
#'
#' After calling this function, fcuk will be launched everytime you launch your
#' current R project (or any project if you use option `global = TRUE`).
#'
#' @param global Whether to add it to the global .Rprofile (`TRUE`, the default)
#'   or just to the .Rprofile file of your current project (`FALSE`).
#'
#' @return Invisibly returns `NULL`.
#' @export
#' @examples
#' \dontrun{
#' fcuk::add_fcuk_to_rprofile()
#' }
add_fcuk_to_rprofile <- function(global = TRUE) {
  file <- if (global) "~/.Rprofile" else ".Rprofile"

  if (file.exists(file)) {
    rl <- readLines(file, warn = FALSE)
    rl_clean <- trimws(rl)
    rl_clean <- rl_clean[!grepl("^#", rl_clean)]

    already_there <- any(grepl("(fcuk)", rl_clean, fixed = TRUE))
    if (already_there) {
      cli::cli_alert_warning("fcuk was already in {.file {file}}")
      return(invisible(NULL))
    }
  }

  to_add <- "\nif (interactive()) {\n  suppressMessages(require(fcuk))\n}\n"
  cat(to_add, file = file, append = TRUE)
  cli::cli_alert_success("Adding fcuk to {.file {file}}")

  invisible(NULL)
}
