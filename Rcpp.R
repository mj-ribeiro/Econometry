
# Comparação entre c++ e R


library(Rcpp)

library('microbenchmark')



soma_r <- function(v) {
  total <- 0
  for (e in v) {
    if (e < 0) { total = total - e }
    else if (e > 0.75) { total = total + e/2 }
    else { total = total + e }
  }
  
  return(total)
}


cppFunction(
  "double soma_c(NumericVector v) {
    double total = 0;
    for (int i = 0; i < v.size(); i++) {
      if (v[i] < 0) { total -= v[i]; }
      else if (v[i] > 0.75) { total += v[i]/2; }
      else { total += v[i]; }
    }

    return(total);
  }")


vec = rnorm(100000)



soma_c(vec)

soma_r(vec)


microbenchmark::microbenchmark(soma_r(vec), soma_c(vec))




cppFunction(
  "int pr() {
    for (int i=0; i<5; i++) {
      std::cout<<i<< std::endl;
}}")


pr()




cppFunction(
  "int adicao_c(int x, int y, int z) {
    int sum = x + y + z;
    return sum;
  }")





