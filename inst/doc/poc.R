## ------------------------------------------------------------------------
library(fcuk)

error_analysis("view()")

## ------------------------------------------------------------------------
error_analysis("sl()")

## ------------------------------------------------------------------------

addTaskCallback(
  function(expr, value, ok, visible) {
print("ok")
    TRUE
  }
)
getTaskCallbackNames()

print(1) #ok 
ls() #ok
#dont_exist()# the taskcallback isnt activated
removeTaskCallback("1")

## ------------------------------------------------------------------------
.Internal(.addCondHands("error",
                        list(
                          error = function(e) {
                            fcuk::error_analysis(e$call)
                          }
                        ),
                        .GlobalEnv, NULL,TRUE))

## ------------------------------------------------------------------------
ls()  # OK

#sl()

# > You ask :sl()
# 
# > Maybe you mean : ls or nls ? 
# > Error in sl() : could not find function "sl"


# sl() # just the error
#view() # just the error

## ------------------------------------------------------------------------
init_error<-function(){
  .Internal(.addCondHands("error",
                        list(
                          error = function(e) {
                            fcuk::error_analysis(e$call)
                          }
                        ),
                        .GlobalEnv, NULL,TRUE))
}
init_error()

#sl()  #just the error
#view()#just the error

