
setwd('D:/Git projects/Econometry')   # definir o diret�rio


## M�todo da bisse��o - Serve para encontrar a raiz de uma fun��o

# Bastante utilizado em macroeconomia

# Vou resolver o problema que est� no wikip�dia

# https://en.wikipedia.org/wiki/Bisection_method



# vou criar a fun��o


fx = function(x){
  x^3 - x - 2
}



# plot

curve(fx(x), xlim=c(-5, 5))
abline(h=0)


## definir norma e toler�ncia

norma= 1
tol = 1e-6

## definir o raiz low (r_l) e raiz high (r_h)

r_l = -4
r_h =  4


## solution usando o while

while (norma>tol) {
  r_bar = 0.5*(r_h + r_l)
  if(fx(r_bar)>0){
    r_h = r_bar
  } else{
    r_l = r_bar
  }
  norma = abs(r_l - r_h)                 # o loop continua enquanto  abs(r_l - r_h)  
                                            # for maior que a toler�ncia
  cat('norma=', norma, ',r_l=', r_l, '\n')
}



## confira se minha solu��o bateu com a do wikip�dia





