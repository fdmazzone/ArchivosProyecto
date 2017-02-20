# -*- coding: utf-8 -*-
"""
Created on Tue Feb 14 13:31:24 2017

@author: fernando
"""
#valores que se pueden cambiar
r=3**0.5/2**(1/6.0)
p1=1
p2=4
Gr=(3**0.5/2**(1/6.0))**4/4#r**p1/p1 #1/p1-1/p2+r**2/2

#
X=arange(-1.2*r,1.2*r,.01)
Y=arange(-1.2*r,1.2*r,.01)
X,Y=meshgrid(X,Y)
Z=abs(X)**p1/p1+abs(Y)**p2/p2
ZZ=abs(X)**2+abs(Y)**2
#fig=figure()
#ax=Axes3D(fig)
#ax.plot_surface(X,Y,Z)
#xlabel('X')
#ylabel('Y')
#show()

fig=figure()
cp = contour(X, Y, Z,[Gr])
cp2=contour(X, Y, ZZ,[r**2])
axes().set_aspect('equal')
clabel(cp, inline=True,fontsize=10)
title('Contour Plot')
xlabel('X')
ylabel('Y')

show()