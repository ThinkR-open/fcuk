#include <Rcpp.h>

extern SEXP R_CurrentExpr;

// [[Rcpp::export]]
SEXP current(){ return R_CurrentExpr ; }