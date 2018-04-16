## ----eval=FALSE----------------------------------------------------------
#  library(fcuk)
#  
#  # Examples
#  sl()
#  > Error in sl() : impossible de trouver la fonction "sl"
#  Did you mean : ls or nls ?
#  
#  iri
#  > Erreur : objet 'iri' introuvable
#  Did you mean : IQR or iris ?
#  
#  view
#  > Erreur : objet 'view' introuvable
#  Did you mean : View or deriv ?
#  
#  mea
#  > Erreur : objet 'mea' introuvable
#  Did you mean : mean or frame ?
#  

## ------------------------------------------------------------------------
.First <- function(){
cat("\n Bonjour !  - ", date(), "\n") 
library(fcuk)
}

