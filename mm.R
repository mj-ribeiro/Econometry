
y = c(  1, 4, 3,  5, 7)
x = c(0.5, 1, 2, 11, 2)

df = data.frame(y, x)

pars = c(1, 2)



otim = function(data, pars){
  y_hat = pars[1] + pars[2]*df[,2]
  y_hat_med = mean(y_hat)
  y_med = mean(df[,1])
  dist = abs(y_hat_med - y_med)
  return(dist)
}


otim(df, pars)


library(optimx)


optim(par = pars, fn = otim, data=df)













