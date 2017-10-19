# -*- coding: utf-8 -*-
"""
Created on Thu May 18 08:44:35 2017

@author: fernando
"""

from sympy import *
r12,r13,r14,r23,r24,r34=symbols('r12,r13,r14,r23,r24,r34')

def CayleyMenger4(r12,r13,r14,r23,r24,r34):
    return det(Matrix([[0,1,1,1,1],[1,0,r12,r13,r14],[1,r12,0,r23,r24],[1,r13,r23,0,r34],[1,r14,r24,r34,0]]))

def CayleyMenger3(r12,r13,r23):
    return det(Matrix([[0,1,1,1],[1,0,r12,r13],[1,r12,0,r23],[1,r13,r23,0]]))

