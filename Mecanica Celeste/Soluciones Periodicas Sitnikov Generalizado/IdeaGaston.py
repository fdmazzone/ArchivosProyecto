# -*- coding: utf-8 -*-
"""
Created on Wed Oct 19 18:04:49 2016

@author: fernando
"""
Cant_Cuerpos=3
m=sym.symbols('m0:3')
#f=((m1+3*m2)*r**2+(2*m1+3*m2)*r+m1+m2)/((m0+m1)*r**2+(3*m0+2*m1)*r+3*m0+m1)
x=sym.symbols('x0:3')
U=sum([ sum([m[i]*m[j]/abs(x[i]-x[j]) for i in range(j) ]) for j in range(Cant_Cuerpos)])
IA=sum([m[i]*x[i]**2 for i in range(Cant_Cuerpos)])
ret=IA-U