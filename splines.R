
# see:
#https://towardsdatascience.com/unraveling-spline-regression-in-r-937626bc3d96

library(MASS)
data(GAGurine)

library(tidyverse)

df = GAGurine

df = as_tibble(df)


df %>%
  ggplot(aes(y=GAG)) +
  geom_point(aes(x=Age), cex=2, color='darkred', pch=19)+
  geom_smooth(aes(x=Age, y=GAG),method = 'gam')+
  theme(panel.background = element_rect(fill='linen'))



set.seed(45)

# tamanho do treino ----

tr = round(0.8*nrow(df))

# amostra ----


treino = sample(nrow(df), tr, replace=F)


# Treino e teste ----


df_treino = df[treino, ]
df_teste = df[-treino, ]


# regressão polinomial ----


for (o in 1:5) {
  m1 = lm(GAG ~ poly(Age, o, raw = T), df_treino)
  assign(paste('lm', o, sep=''), m1)
}


anova(lm1, lm2, lm3, lm4, lm5)


summary(lm5)


# forecast com reg polinomial -----


x = seq(min(df$Age), max(df$Age), length=100)

y_hat = predict(lm5, newdata = data.frame(Age = x), interval = 'confidence')

plot(GAG~Age, df_treino, pch=19, col='red3')
lines(x, y_hat[,1], col='seagreen', lwd=2)
matlines(x, y_hat[,2:3], col='lightseagreen', lwd=1, lty = 2) #plota duas colunas



# step function -----


step1 = lm(GAG~cut(Age, 4), data=df_treino) # cut gera um fator, logo as variáveis são dummies
summary(step1)                


y_hat_step = predict(step1,newdata = data.frame(Age=x), interval = 'confidence' )

plot(GAG~Age, df_treino, pch=20, col='red3')
lines(x, y_hat_step[,1], col='seagreen', lwd=2)
matlines(x, y_hat_step[,2:3], col='lightseagreen', lwd=1, lty = 2) #plota duas colunas




# Splines - polinômios por partes -----

library(splines)

sp1 = lm(GAG~bs(Age, knots = c(4.42, 8.84, 13.3)), df_treino)
summary(sp1)

y_hat_sp1 = predict(sp1, newdata = data.frame(Age=x), interval = 'confidence' )

plot(GAG~Age, df_treino, pch=20, col='red3')
lines(x, y_hat_sp1[,1], col='seagreen', lwd=2)
matlines(x, y_hat_sp1[,2:3], col='lightseagreen', lwd=1, lty = 2) #plota duas colunas
abline(v = attr(bs(df_treino$Age, knots = c(4.42, 8.84, 13.3)), 'knots'), col='gray', lty=2 )




# criando a spline ----

knot = c(4.42, 8.84, 13.3)

x_k1 = df$Age - knot[1]
x_k1[x_k1<0] = 0
  
x_k2 = df$Age - knot[2]
x_k2[x_k2<0] = 0


x_k3 = df$Age - knot[3]
x_k3[x_k3<0] = 0


my_sp = lm(GAG ~ Age + I(Age^2) + I(Age^3) + 
             I(x_k1^3) + I(x_k2^3) + I(x_k3^3), df)

summary(my_sp)



# Spline natural ----



sp_nat = lm(GAG ~ ns(Age, df = 6), df)

summary(sp_nat)

y_hat_nat = predict(sp_nat, newdata = data.frame(Age=x), interval = 'confidence' )

plot(GAG~Age, df_treino, pch=20, col='red3', main = 'Natural Spline', cex=1.5)
lines(x, y_hat_nat[,1], col='seagreen', lwd=2)
matlines(x, y_hat_nat[,2:3], col='lightseagreen', lwd=1, lty = 2) #plota duas colunas
abline(v = attr(ns(df$Age, df = 6), 'knots'), col='gray', lty=2 )


# Smooth splines ----

attach(df_treino)

ssm1 = smooth.spline(Age, GAG, df=30)
ssm2 = smooth.spline(Age, GAG, cv = T, penalty = 1 )


plot(GAG~Age, df_treino, pch=20, col='red', main = 'Smooth Spline', cex=1.1)
lines(ssm1,  col = 'navy', lwd = 4, lty = 2)
lines(ssm2,  col = 'seagreen', lwd = 2)
legend('topright', legend = c(paste0('df = ', round(ssm2$df, 2) ), 'df = 30'),
       col = c('seagreen', 'navy'), lty=1:2, lwd = 4)


# Local regression ----

loc1 = loess(GAG ~ Age, span = 0.1, df_treino)

loc2 = loess(GAG ~ Age, span = 0.5, df_treino)

summary(loc2)


y_hat_loc1 = predict(loc1, newdata = data.frame(Age = x), interval = 'confidence' )
y_hat_loc2 = predict(loc2, newdata = data.frame(Age = x), interval = 'confidence' )

plot(GAG ~ Age, df_treino, pch=20, col='red', main = 'Local regression', cex=1.1)
lines(x, y_hat_loc1, col = 'navy', lwd = 4, lty = 2 )
lines(x, y_hat_loc2, col = 'seagreen', lwd = 4)
legend('topright', legend = c('span = 0.1', 'span = 0.5'),
       col = c('navy', 'seagreen'), lty=2:1, lwd = 4)




# comparar modelos ----


loc1_t = predict(loc1, newdata = df_treino)
loc2_t = predict(loc2, newdata = df_treino)
sp_nat_t = predict(sp_nat, newdata = df_treino)
#ssm1_t = predict(ssm1, newdata = df_treino)
#ssm2_t = predict(ssm2, newdata = df_treino)
sp1_t = predict(sp1, newdata = df_treino)
lm5_t = predict(lm5, newdata = df_treino)
step1_t = predict(step1, newdata = df_treino)



library(caret)

t1 = data.frame(obs = df_treino$GAG, pred = loc1_t )

t2 = data.frame(obs = df_treino$GAG, pred = loc2_t )

t3 = data.frame(obs = df_treino$GAG, pred = sp_nat_t )

t4 = data.frame(obs = df_treino$GAG, pred = sp1_t )

t5 = data.frame(obs = df_treino$GAG, pred = lm5_t )

t6 = data.frame(obs = df_treino$GAG, pred = step1_t )



res_t = data.frame(
  loc1 = defaultSummary(t1),
  loc2 = defaultSummary(t2),
  sp_nat = defaultSummary(t3),
  sp1 = defaultSummary(t4),
  lm5 = defaultSummary(t5),
  step1 = defaultSummary(t6)
)


res_t








