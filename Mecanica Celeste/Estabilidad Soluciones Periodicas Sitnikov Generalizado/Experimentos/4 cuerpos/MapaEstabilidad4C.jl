
#Requiere using PyPlot, y Estabilidad-n-colineales.jl
#El input de esta función es un vector X de posiciones de los primarios intermedios.
#[-1 -x_j  x_j 1]
#v=vector de posiciones iniciales de la partículo no grave.

function MapaEstabilidad4C(x,v)
#x=linspace(0.01,0.41,50)
#v=linspace(50,60,50)

bb=Array{Bool}(size(v)[1],1)

for i in x
    m=ColinealInv([-1 -i  i 1])


    (a₁,a₂,T,Δ)=Estabilidad(m[3:4],[i 1], v)
    aa=isreal.(Δ).*(abs.(a₁).<=2).*(abs.(a₂).<=2)
    bb=hcat(bb,aa)
    #print(aa)
end
cc=bb[:,2:size(x)[1]+1];
#cc[2,2]=true
xgrid=repmat(x',size(v)[1],1);
vgrid = repmat(v,1,size(x)[1]);
xestable=xgrid[cc];
vestable=vgrid[cc] ;
fig, ax=subplots()

#ax[:contourf](lambdagrid,vgrid,  cc1', [0.5,1], colors="red", linewidth=2.0)
#for i in 1:size(x)[1]
 #   intest=v[cc[:,i]]
  #  xi=x[i]*ones(size(intest))
    ax[:scatter](xestable,vestable,color="black", marker=:.)
#end


xlabel("x")
ylabel("v")

#ax[:text](.41,.41,L"p_1")

return xestable, vestable
title("Stability Map")
end
