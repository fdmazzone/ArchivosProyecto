function Estructura= sistema_ficticio(GM1);
  





%%%% Definicion de parametros del sistema para la funcion fuerza

Estructura.cantidad_planetas=length(GM1)-1;


I=1:1:Estructura.cantidad_planetas+1;
Estructura.indices=nchoosek(I,2);


Estructura.Indicador=[];
for indi=2:Estructura.cantidad_planetas+1
    Iaux=find(Estructura.indices(:,1)==indi);
    Jaux=find(Estructura.indices(:,2)==indi);
    Estructura.Indicador=[Estructura.Indicador,[Jaux',Iaux']];
end




Estructura.GM=zeros( Estructura.cantidad_planetas,Estructura.cantidad_planetas^2);
columna=1;
for j=1:Estructura.cantidad_planetas-1
    Estructura.GM(j,columna:columna+Estructura.cantidad_planetas-1)=[-GM1(1:j),GM1(j+2:end)];
    columna=columna+Estructura.cantidad_planetas;
end
Estructura.GM(Estructura.cantidad_planetas,columna:columna+Estructura.cantidad_planetas-1)=-GM1(1:end-1);
columna=columna+Estructura.cantidad_planetas;


Estructura.GM=Estructura.GM(1:Estructura.cantidad_planetas,1:Estructura.cantidad_planetas^2);


Estructura.GM=sparse(Estructura.GM);