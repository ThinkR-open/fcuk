# fcuk

Because sometimes we make mistake.

## Installation



```R
if (!require(devtools)){install.packages("devtools")}
devtools::install_github("ThinkRstat/fcuk")
library(fcuk)
sl()
iri
view
mea
```


Usage

feel free to add this inside your .Rprofile or Rprofile.site files

```R

.First <- function(){
cat("\n Bonjour !  - ", date(), "\n") 
library(fcuk)
}


```
You can use `fcuk::add_fcuk_to_rprofile()` to do so.
But It could be more efficient to add this inside your `Rprofile.site` file to have this functionnality inside all your Rstudio project.




