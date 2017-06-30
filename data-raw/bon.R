
library(stringdist)

#' Title
#'
#' recupere tous les mot possible qui ont du sens dans la session de l'utilisateur
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' get_candidat()
get_candidat <- function(...){
    unname(unlist(sapply(search(),function(x){ls(x)})))
  }

erreur_typo <- function(car){
  # browser()
  # ici on va calculer la distance du mot tapé avec les mot possibles
  candidats <- get_candidat()
  candidats[order(stringdist(car,candidats))][1:7]
}

error_analysis <- function(error) {
  # browser()
  message("tu as fait cette erreur :", deparse(error), "\n")
  cat("peut etre voulais tu tapper :", erreur_typo(as.character(error)[1]),"\n")
  .Internal(.addCondHands("error",
                          list(
                            error = function(e) {
                              error_analysis(e$call)
                            }
                          ),
                          .GlobalEnv, NULL,TRUE))
}

.Internal(.addCondHands("error",
                        list(
                          error = function(e) {
                            fcuk::error_analysis(e$call)
                          }
                        ),
                        .GlobalEnv, NULL,TRUE))
ls()
sl()
sl(truc="budil",machin="ff",er=3)



init <- function(){

  .Internal(.addCondHands("error",
                          list(
                            error = function(e) {
                              error_analysis(e$call)
                            }
                          ),
                          .GlobalEnv, .GlobalEnv,TRUE))
}
init()
sl()



