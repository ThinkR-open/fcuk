# from usethis https://github.com/r-lib/usethis
cat_line <- function(...) {
  cat(..., "\n", sep = "")
}

bullet <- function(lines, bullet) {
  lines <- paste0(bullet, " ", lines)
  cat_line(lines)
}
#' @importFrom crayon green red
#' @importFrom clisymbols symbol
done <- function(...) {
  bullet(paste0(...), bullet = crayon::green(clisymbols::symbol$tick))
}
enod <- function(...) {
  bullet(paste0(...), bullet = crayon::red(clisymbols::symbol$warning))
}
