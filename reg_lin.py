# -*- coding: utf-8 -*-
"""
Created on Tue Aug 18 10:50:58 2020

@author: Marcos J Ribeiro
"""

import numpy as np
import scipy.optimize as sp
import pandas as pd
import statsmodels.formula.api as smf


y = np.array((1, 2, 5, 6, 7, 8))
x = np.array((3, 0, 9, 1, 11, 5))


def obj(X):
    a = X[0] 
    b= X[1] 
    epsilon = (y - a - b*x)**2
    sum_epsilon = epsilon.sum()
    return sum_epsilon


X = np.array((0.3, 11))

obj(X)

X[1]

sp.minimize(obj, X)


df = pd.DataFrame(y, x)

reg = smf.ols('y~x', data=df).fit()

print(f'\033[1;033m {reg.summary()}')






