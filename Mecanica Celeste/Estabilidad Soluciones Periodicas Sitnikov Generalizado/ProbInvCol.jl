function ColinealInv(x)
  #x vector fila de posiciones
  l=size(x)[2]
  D=ones(size(x'))*x
  C=D-D'
  A=((abs.(C)).^(-3)).*C
  for i=1:l
    A[i,i]=0
  end
  return (A-eye(l))\x'
end
