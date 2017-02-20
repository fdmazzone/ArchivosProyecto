# -*- coding: utf-8 -*-
"""
Created on Mon Feb 13 13:44:48 2017

@author: fernando
"""

X=arange(-10,10,.1)
Y=arange(-10,10,.1)
p1=1.1
p2=2
X,Y=meshgrid(X,Y)
Z=abs(X)**p1+abs(Y)**p2
#fig=figure()
#ax=Axes3D(fig)
#ax.plot_surface(X,Y,Z)
#xlabel('X')
#ylabel('Y')
#show()

fig=figure()
V=[k**2 for k in arange(0,10,.5)]
cp = contour(X, Y, Z,V)
axes().set_aspect('equal')
clabel(cp, inline=True,fontsize=10)
title('Contour Plot')
xlabel('X')
ylabel('Y')

show()