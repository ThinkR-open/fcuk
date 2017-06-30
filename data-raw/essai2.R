options( error = function(){ .rs.recordTraceback(TRUE, 0, .rs.enqueueError) }  )
options( error = function(...){ cat(...) }  )
options( error =   .Internal(.addCondHands("error",
                                           list(
                                             error = function(e) {
                                               error_analysis(e$call)
                                             }
                                           ),
                                           .GlobalEnv, .GlobalEnv,TRUE))  )

options(error = function() traceback(2))
options( error = function(...){ print("coucou") }  )
debug(.rs.recordTraceback)
1+1
ls()
sl()
geterrmessage()

for (
  i in

      1:10)
{

  print('coucou')
  if(i>7){sl()}
}


sl()
options(error = function() traceback(0))
sl()
options(error = function() traceback(1))
sl()
options(error = function() traceback(-1))
sl()
options(error = function() traceback(-2))
sl()
options(error = function() traceback(2))
sl()
options(error = function() traceback(3))
sl()
options(error = function() traceback(4))
sl()


