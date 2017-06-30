
get_candidat <- function(...){
  unname(unlist(sapply(search(),function(x){ls(x)})))
}
compare_methode<-function(erreur_typo){
 
lapply(
  erreur_typo,
  function(car){
sapply( c("osa", "lv", "dl", "hamming", "lcs", "qgram",
          "cosine", "jaccard", "jw"),
        function(x){
                    candidats[order(stringdist(tolower(car),tolower(candidats),method = x))][1:4]
        })

  }) %>% setNames(erreur_typo)
  
  }

choix <- function(tt,n=2){
  lapply(tt,n=n,function(x,n){
    x[seq_len(n),] %>% as.vector() %>% table %>% sort(decreasing=TRUE) %>% names() %>% .[1:5]
  })
}

  
  candidats <- get_candidat()
  c("view","sl","haed","hea","as.date","ljjghrdd") %>% 
    compare_methode() %>% 
    choix 
