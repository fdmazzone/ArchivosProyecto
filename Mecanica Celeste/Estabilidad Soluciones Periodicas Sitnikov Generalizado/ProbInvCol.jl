function ColinealInv(x)
  #x vector fila de posiciones
  l=size(x)[2]
  D=ones(l,1)*x
  C=D-D'
  A=((abs.(C)).^(-3)).*C
  for i=1:l
    A[i,i]=0
  end
  return A\(-x')
end
A = [ ColinealInv([-1 -x -x*y x*y x 1]) for x=0.1:.01:.99, y=0.1:.01:.99 ];
B=[~any(k->k<0,l) for l in A]
