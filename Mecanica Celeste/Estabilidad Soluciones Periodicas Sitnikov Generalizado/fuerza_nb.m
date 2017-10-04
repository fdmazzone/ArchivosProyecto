function estado_aceleracion=fuerza_nb(estado,funcion_datos)
n=size(estado,2)/3;% número de cuerpos
s_est=size(estado,1);% número de épocas
R=permute(reshape(estado',[3,n,s_est]),[2,1,3]);% transformamos la matriz estado en una sucecion de matrices nx3 (hojas),
%una por cada tiempo, que contienen la posicion de los cuerpos
sR=size(R);% ya se conoce este dato,sR= [n,3,s_est]

% calcula la posicion del cuerpo faltante en termino de los anteriores
R0=reshape(([-funcion_datos.GM(2,funcion_datos.cantidad_planetas+2),funcion_datos.GM(1,2:funcion_datos.cantidad_planetas)]/funcion_datos.GM(1,1))*R_pla(:,:),[1, sR(2:end)]);
R=cat(1,R0,R);% agrega el cuerpo faltante a los n-1 dados
diferencias=R(funcion_datos.indices(:,1),:,:)-R(funcion_datos.indices(:,2),:,:);
norma_diferencias=(sum(diferencias.^2,2).^(-1.5));
diferencias=repmat(norma_diferencias,[1,3,1]).*diferencias;
diferencias=diferencias(funcion_datos.Indicador,:,:);
sdif=size(diferencias);
estado_aceleracion=permute(reshape(-funcion_datos.GM*diferencias(:,:),[n,sdif(2:end)]),[2,1,3]);
estado_aceleracion=reshape(estado_aceleracion,[3*n,s_est])';

 