

res <- c()
for ( i in list.files("C:\\Program Files\\R\\R-3.4.0\\library\\translations")){
  print(i)
  Sys.setenv(LANG = i)
  Sys.setenv(LANGUAGE =i)
  try(sl())
  res <- c(res,geterrmessage())
  try(iri)
  res <- c(res,geterrmessage())
}
res<-c(
  "Error in sl() : \"sl\" fonksiyonu bulunamadi\n"="Error in sl() : \"sl\" fonksiyonu bulunamadi\n",
  "Error in sl() : could not find function \"sl\"\n"="Error in sl() : could not find function \"sl\"\n", 
  "Error in sl() : fann ikkje funksjonen «sl»\n"="Error in sl() : fann ikkje funksjonen «sl»\n", 
  "Error in sl() : impossible de trouver la fonction \"sl\"\n"="Error in sl() : impossible de trouver la fonction \"sl\"\n", 
  "Error in sl() : konnte Funktion \"sl\" nicht finden\n"="Error in sl() : konnte Funktion \"sl\" nicht finden\n",
  "Error in sl() : não foi possível encontrar a função \"sl\"\n"="Error in sl() : não foi possível encontrar a função \"sl\"\n", 
  "Error in sl() : nie udalo sie znalezc funkcji 'sl'\n"="Error in sl() : nie udalo sie znalezc funkcji 'sl'\n", 
  "Error in sl() : no se pudo encontrar la función \"sl\"\n"="Error in sl() : no se pudo encontrar la función \"sl\"\n", 
  "Error in sl() : non trovo la funzione \"sl\"\n"="Error in sl() : non trovo la funzione \"sl\"\n",
  "Error in try(iri) : 'iri' nesnesi bulunamadi\n"="Error in try(iri) : 'iri' nesnesi bulunamadi\n", 
  "Error in try(iri) : fann ikkje objektet «iri»\n"="Error in try(iri) : fann ikkje objektet «iri»\n", 
  "Error in try(iri) : nie znaleziono obiektu 'iri'\n"="Error in try(iri) : nie znaleziono obiektu 'iri'\n", 
  "Error in try(iri) : object 'iri' not found\n"="Error in try(iri) : object 'iri' not found\n", 
  "Error in try(iri) : object ‘iri’ not found\n"="Error in try(iri) : object ‘iri’ not found\n", 
  "Error in try(iri) : objekt 'iri' blev ikke fundet\n"="Error in try(iri) : objekt 'iri' blev ikke fundet\n", 
  "Error in try(iri) : Objekt 'iri' nicht gefunden\n"="Error in try(iri) : Objekt 'iri' nicht gefunden\n", 
  "Error in try(iri) : objet 'iri' introuvable\n"="Error in try(iri) : objet 'iri' introuvable\n",
  "Error in try(iri) : objeto 'iri' não encontrado\n"="Error in try(iri) : objeto 'iri' não encontrado\n", 
  "Error in try(iri) : objeto 'iri' no encontrado\n"="Error in try(iri) : objeto 'iri' no encontrado\n",
  "Error in try(iri) : oggetto \"iri\" non trovato\n"="Error in try(iri) : oggetto \"iri\" non trovato\n"
)
gettext("could not find function",domain = "fr")



c("Error in sl() : \"sl\" fonksiyonu bulunamadi\n", 
            "Error in sl() : could not find function \"sl\"\n", "Error in sl() : fann ikkje funksjonen «sl»\n", 
            "Error in sl() : impossible de trouver la fonction \"sl\"\n", 
            "Error in sl() : konnte Funktion \"sl\" nicht finden\n", "Error in sl() : não foi possível encontrar a função \"sl\"\n", 
            "Error in sl() : nie udalo sie znalezc funkcji 'sl'\n", "Error in sl() : no se pudo encontrar la función \"sl\"\n", 
            "Error in sl() : non trovo la funzione \"sl\"\n", "Error in try(iri) : 'iri' nesnesi bulunamadi\n", 
            "Error in try(iri) : fann ikkje objektet «iri»\n", "Error in try(iri) : nie znaleziono obiektu 'iri'\n", 
            "Error in try(iri) : object 'iri' not found\n", "Error in try(iri) : object ‘iri’ not found\n", 
            "Error in try(iri) : objekt 'iri' blev ikke fundet\n", "Error in try(iri) : Objekt 'iri' nicht gefunden\n", 
            "Error in try(iri) : objet 'iri' introuvable\n", "Error in try(iri) : objeto 'iri' não encontrado\n", 
            "Error in try(iri) : objeto 'iri' no encontrado\n", "Error in try(iri) : oggetto \"iri\" non trovato\n"
), .Names = c("Error in sl() : \"sl\" fonksiyonu bulunamadi\n", 
              "Error in sl() : could not find function \"sl\"\n", "Error in sl() : fann ikkje funksjonen «sl»\n", 
              "Error in sl() : impossible de trouver la fonction \"sl\"\n", 
              "Error in sl() : konnte Funktion \"sl\" nicht finden\n", "Error in sl() : não foi possível encontrar a função \"sl\"\n", 
              "Error in sl() : nie udalo sie znalezc funkcji 'sl'\n", "Error in sl() : no se pudo encontrar la función \"sl\"\n", 
              "Error in sl() : non trovo la funzione \"sl\"\n", "Error in try(iri) : 'iri' nesnesi bulunamadi\n", 
              "Error in try(iri) : fann ikkje objektet «iri»\n", "Error in try(iri) : nie znaleziono obiektu 'iri'\n", 
              "Error in try(iri) : object 'iri' not found\n", "Error in try(iri) : object ‘iri’ not found\n", 
              "Error in try(iri) : objekt 'iri' blev ikke fundet\n", "Error in try(iri) : Objekt 'iri' nicht gefunden\n", 
              "Error in try(iri) : objet 'iri' introuvable\n", "Error in try(iri) : objeto 'iri' não encontrado\n", 
              "Error in try(iri) : objeto 'iri' no encontrado\n", "Error in try(iri) : oggetto \"iri\" non trovato\n"
)

names(regex_rules())

for ( sentence in names(regex_rules())){
regex_rules() %>% 
  map_chr(~sub(.x,"\\1",sentence)) %>%
  unname() %>%
  .[. != sentence] %>% print
}

sub(".*konnte Funktion \"(.*)\" nicht finden\n",
    "\\1",
    "Error in sl() : konnte Funktion \"sl\" nicht finden\n")

regex_rules() %>% 
  map_chr(~sub(.x,"\\1",names(regex_rules())[5])) %>%
  # unname() %>%
  .[. != sentence]
