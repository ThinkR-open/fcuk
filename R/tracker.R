# tracker <- function(){
#
#   .Internal(.addCondHands("error",
#                           list(
#                             error = function(e) {
#                               fcuk::error_analysis(e$call)
#                             }
#                           ),
#                           .GlobalEnv, NULL,TRUE))
#
# TRUE
# }
# tracker2 <- function(){
#
#   .Internal(.addCondHands("error",
#                           list(
#                             error = function(e) {
#                               fcuk::error_analysis(e$call)
#                             }
#                           ),
#                           .GlobalEnv, NULL,FALSE))
#
# TRUE
# }
# tracker3 <- function(){
#
#   .Internal(.addCondHands("error",
#                           list(
#                             error = function(e) {
#                               fcuk::error_analysis(e$call)
#                             }
#                           ),
#                           .GlobalEnv, .GlobalEnv,TRUE))
#
# TRUE
# }
# tracker4 <- function(){
#
#   .Internal(.addCondHands("error",
#                           list(
#                             error = function(e) {
#                               fcuk::error_analysis(e$call)
#                             }
#                           ),
#                           .GlobalEnv, NULL,TRUE))
#
#
# }
# # tracker()
# # sl()
# # tracker2()
# # sl()
# # tracker3()
# # sl()
# # tracker4()
# # sl()
