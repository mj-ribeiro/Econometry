# Monitoria de econometria - 1


setwd('D:/Git projects/Econometry')   # definir o diretório



## create vectors

x0 = c('ana', 'jonas', 'paulo', 'maria', 'pedro', 'joão', 'carla', 'fernanda')
x1 = c(4.6, 9.5, 4.5, 7, 8, 4, 5.6, 9)
x2 = c(18, 31, 19, 20, 22, 30, 25, 24)
x3 = c('female', 'male', 'male', 'female', 'male', 'male', 'female', 'female')



# len

length(x2)


# create data frame


df = data.frame(x0, x1, x2, x3)


# see elements

head(df, 4)

tail(df, 2)


ncol(df)
nrow(df)


str(df)

# col names


names(df)


# change colnames

names(df)[1] = 'names'

names(df) = c('names', 'grades', 'age', 'sex')


# add new column


df$monitoring = c('no', 'yes', 'no', 'yes', 'yes', 'no', 'no', 'yes')


# operations

df$inter = df$age * df$grades


# slicing

df['names']

df[['names']]

df$names

df$monitoring


df[1, 'age']



df[1, ]

df[2, ]


# filters

df[df$grades>5, ]

df[df$sex=='male', ]


df[df$age>25, ]


# index

# install.packages('zoo')

library(zoo)

index(df)

row.names(df) = x0



df[1] = NULL 


# now

df['ana', ]

df['fernanda', ]


# drop column

df = df[-5]


# NaN

df['pedro', 1] = NaN


summary(df)

na.omit(df)

# 

df['pedro', 1] = 8

mean(df$age)
summary(df$age)



# table

table(df$sex)

table(df$monitoring)


# factors

fator_sex = as.factor(df$sex)

by(df$grades, fator_sex, mean)

by(df$grades, fator_sex, summary)


# by monitoring


fator_monitor = as.factor(df$monitoring)

by(df$grades, fator_monitor, summary)


























