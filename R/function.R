# Cache environment for storing objects list
.fcuk_cache <- new.env(parent = emptyenv())

#' Extract the name of all objects loaded in the R environments
#'
#' Fetch the name of all objects loaded in the environments (functions, values, data...)
#'
#' @param use_cache Logical. Use cached results if available (default: TRUE).
#'   Cache is invalidated when environment changes.
#'
#' @return A character vector with the names of all objects contained in the environments
#' @export
#' @examples
#' get_all_objects_from_r()
get_all_objects_from_r <- function(use_cache = TRUE) {
  current_search <- search()
  cache_key <- paste(current_search, collapse = "|")

  if (use_cache && exists("objects_cache", envir = .fcuk_cache)) {
    cached <- get("objects_cache", envir = .fcuk_cache)
    if (identical(cached$key, cache_key)) {
      return(cached$value)
    }
  }

  objects_list <- lapply(current_search, ls, all.names = TRUE)
  objects <- do.call(c, objects_list)
  packages <- rownames(utils::installed.packages())
  result <- c(objects, packages)

  assign(
    "objects_cache",
    list(key = cache_key, value = result),
    envir = .fcuk_cache
  )

  result
}

#' @rdname get_all_objects_from_r
#' @export
get_all_objets_from_r <- function(use_cache = TRUE) {
  .Deprecated("get_all_objects_from_r")
  get_all_objects_from_r(use_cache = use_cache)
}

#' Find closest object names
#'
#' Analyse a typo and suggests the closest names.
#'
#' @param asked_objet The R name producing an error.
#' @param method Method for distance calculation. The default is "jaccard",
#'   see [stringdist::stringdist-metrics].
#' @param n Number of corrections to suggest (default: 2).
#'
#' @return A character vector with the closest neighbors, or `character(0)` if
#'   no valid input is provided.
#' @export
#' @examples
#' error_correction_propostion("iri")
#' error_correction_propostion("view")
error_correction_propostion <- function(
  asked_objet,
  method = "jaccard",
  n = 2
) {
  if (!is.character(asked_objet) || length(asked_objet) == 0) {
    return(character(0))
  }
  if (!is.numeric(n) || n < 1) {
    return(character(0))
  }

  candidats <- get_all_objects_from_r()
  distances <- stringdist::stringdist(
    tolower(asked_objet),
    tolower(candidats),
    method = method
  )

  ordered_idx <- order(distances)
  candidats[ordered_idx[seq_len(min(n, length(candidats)))]]
}


#' Error Analysis
#'
#' Analyse the last error message and suggest corrections.
#'
#' @param asked_objet The name to analyse. Defaults to extracting from last error.
#' @param n Number of names to suggest (default: 2).
#'
#' @return Invisibly returns a string with the suggestions, or `NULL` if no
#'   error could be parsed.
#' @export
#' @examples
#' fcuk::error_analysis() # last error is analysed
#' fcuk::error_analysis("view")
#' fcuk::error_analysis("iri")
error_analysis <- function(asked_objet = catch_error(), n = 2) {
  if (length(asked_objet) == 0 || all(is.na(asked_objet))) {
    return(invisible(NULL))
  }

  object_name <- as.character(asked_objet)[1]

  if (nchar(object_name) == 0) {
    return(invisible(NULL))
  }

  corr <- error_correction_propostion(object_name, n = n)

  if (length(corr) == 0) {
    return(invisible(NULL))
  }

  out <- paste(corr, collapse = gettext(" or "))

  cli::cli_text("{.strong {gettext('Did you mean')}} : {.val {corr}} ?")

  init_rerun(corr, geterrmessage(), asked_objet)

  invisible(out)
}


#' Capture and parse an error message
#'
#' Extract the object or function name from an error message.
#'
#' @param sentence An error message to parse. Defaults to the last error message.
#'
#' @return A character vector with extracted names, or `character(0)` if
#'   no match is found.
#' @export
#' @examples
#' catch_error()
#' catch_error("Error: object 'iri' not found\n")
#' catch_error("Error: object 'view' not found\n")
catch_error <- function(sentence = geterrmessage()) {
  if (length(sentence) == 0 || !nzchar(sentence)) {
    return(character(0))
  }

  rules <- regex_rules()
  matches <- vapply(
    rules$regex,
    function(pattern) sub(pattern, "\\1", sentence),
    character(1)
  )

  matches[matches != sentence]
}


#' Init error tracker
#'
#' After launching this function, every error message will be analysed.
#' This function is called when loading the package.
#'
#' @return Invisibly returns `NULL`.
#' @export
#' @examples
#' getOption("error")
#' fcuk::init_error_tracker()
#' getOption("error")
init_error_tracker <- function() {
  options("old_error" = getOption("error"))
  options(error = function(...) {
    fcuk::error_analysis()
  })
  invisible(NULL)
}


#' Remove error tracker
#'
#' After launching this function, the errors will no longer be analysed.
#'
#' @return Invisibly returns `NULL`.
#' @export
#' @examples
#' getOption("error")
#' fcuk::remove_error_tracker()
#' getOption("error")
remove_error_tracker <- function() {
  options("error" = getOption("old_error"))
  invisible(NULL)
}
