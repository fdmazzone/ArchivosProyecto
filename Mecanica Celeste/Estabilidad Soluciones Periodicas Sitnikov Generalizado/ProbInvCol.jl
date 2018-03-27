function ColinealInv(x)
  #x vector fila de posiciones
  l=size(x)
  D=ones(size(x'))*x
  A=(D-D').^(-2)
  for i=1:l
    A[i,i]=0
  end 
  return A
end
