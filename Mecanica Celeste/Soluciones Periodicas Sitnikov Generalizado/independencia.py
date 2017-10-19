# -*- coding: utf-8 -*-
"""
Created on Thu Mar 30 08:40:49 2017

@author: fernando
"""
"""
r=symbols('r:3',positive=True)
s,z=symbols('s,z') 
func=1/sqrt(s**2+z**2)**3
A=[]
for i in range(3):
    L=[]
    for k in range(3):
        L=L+[func.subs(s,r[i]).diff(z,k).simplify()]
    A=A+[L]
M=Matrix(A)
"""
x=symbols('x',cls=Function)
yprima=[-3*a for a in y]
#subst={y.diff():-3*x*y**Rational(5,3)}
    