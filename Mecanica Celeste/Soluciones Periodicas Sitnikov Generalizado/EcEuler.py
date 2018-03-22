# -*- coding: utf-8 -*-
"""
Created on Wed Oct 19 17:43:29 2016

@author: fernando
"""
import numpy as np
import matplotlib.pyplot as plt
def func(m):
    #Polinomio=m[0]*r**5 + 3*m[0]*r**4 + 3*m[0]*r**3 + m[1]*r**5 + 2*m[1]*r**4 + m[1]*r**3 - m[1]*r**2 - 2*m[1]*r - m[1] - 3*m[2]*r**2 - 3*m[2]*r - m[2]
    #L=[Polinomio.diff(r,i).subs(r,0)/factorial(i) for i in range(6)]
    #L=L[::-1]
    L=[m[0]+m[1],3*m[0]+2*m[1], 3*m[0]+m[1], -(m[1]+3*m[2]), -(2*m[1]+3*m[2]), -(m[1]+m[2])]
    sol=np.roots(L)
    for s in sol:
        if s.imag==0 and s.real>0:
            Solreal=s.real
    return  Solreal
L=[]
M=[]
for i in range(0,10000):
    L+=[func([1,600,i])**3/i]

plt.plot(L,'o',)
plt.ylim((0,.01))
plt.show()