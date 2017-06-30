options()$error
(function ()
{
  .rs.recordTraceback(TRUE, 5, .rs.enqueueError)
})()

options(error=
function(){.rs.recordTraceback(TRUE, 1, .rs.enqueueError)
})
options()$error

sl()
source("data-raw/a_run.R")
