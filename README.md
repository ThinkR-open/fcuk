[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/fcuk)](https://cran.r-project.org/package=fcuk)
[![](http://cranlogs.r-pkg.org/badges/fcuk)](https://cran.r-project.org/package=fcuk)
[![Travis build status](https://travis-ci.org/ThinkR-open/fcuk.svg?branch=master)](https://travis-ci.org/ThinkR-open/fcuk)
[![Coverage status](https://codecov.io/gh/ThinkR-open/fcuk/branch/master/graph/badge.svg)](https://codecov.io/github/ThinkR-open/fcuk?branch=master)

<img src="https://raw.githubusercontent.com/ThinkR-open/fcuk/master/img/fcuk-hex-thinkr.png" width=250px>

# fcuk

A package designed to help people with clumsy fingers.


![](https://media.giphy.com/media/l0Iy8JGxnl5rE1Z96/giphy.gif)



## Installation of `fcuk`

### From CRAN
```R

install.packages("fcuk")
```


### From github
```R
if (!require(devtools)){install.packages("devtools")}
devtools::install_github("ThinkR-open/fcuk")
```

## Launch and use

After launching this package, every error will be analysed. Each time a typo occurs, a correction suggestion will be made under the default error message. 

```{r}
library(fcuk)

# Examples 
sl()
> Error in sl() : impossible de trouver la fonction "sl"
Did you mean : ls or nls ?

iri
> Erreur : objet 'iri' introuvable
Did you mean : IQR or iris ?

view
> Erreur : objet 'view' introuvable
Did you mean : View or deriv ?

mea
> Erreur : objet 'mea' introuvable
Did you mean : mean or frame ?

```

You can accept `fcuk` correction proposal by using this notation : `.+1` This allows you to rerun the last line by accepting the first correction proposal.
In fact `.+n` will rerun the nth correction proposal.

```{r}
library(fcuk)

# Examples 
sl()
> Error in sl() : impossible de trouver la fonction "sl"
Did you mean : ls or nls ?
> .+1
> ls()

```

## Stop `fcuk`

You can stop `fcuk` at anytime by calling the `remove_error_tracker` function. Start the error tracker again with `init_error_tracker`. 

## Recurrent use of fcuk

You can launch `fcuk` with your R session. 

```{r}
.First <- function(){
cat("\n Bonjour !  - ", date(), "\n") 
library(fcuk)
}
```

It will be more efficient to add this library to your Rprofile. You can use `fcuk::add_fcuk_to_rprofile()` to do so. Then, any time you launch your R project, `fcuk` will be launched at the same time. 

You can also add `fcuk` inside your `Rprofile.site` file. Then you'll have this functionnality inside all your Rstudio projects.

## fcuk functions

You'll typically never need to use the functions contained in `fcuk`. You just need to launch this library, and `fcuk` will do his job in the background. 

## Feedbacks and questions 

Feel free to  report any [issue](https://github.com/ThinkRstat/fcuk/issues) you may have with this package. 
  
  
See full documentation realised using {pkgdown} at <https://thinkr-open.github.io/fcuk/>