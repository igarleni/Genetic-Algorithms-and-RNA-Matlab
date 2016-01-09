clear all
datos = [];
datos = csvread('DatosPareto.txt');

generaciones = size(datos,1);
tamPoblacion = size(datos,2)-1;
datos = datos(:,1:tamPoblacion); %borrar ultima columna de ceros
tamPoblacion = tamPoblacion/2;

%calculo del fitness medio y maximo por generacion
medias = [];
maximos = datos(:,1:2);

for i=1:generaciones
    generacionSemaforo = [];
    generacionAceleracion = [];
    for j=1:tamPoblacion
        generacionSemaforo =[generacionSemaforo;datos(i,1+(j-1)*2)];
        generacionAceleracion = [generacionAceleracion;datos(i,j*2)];
    end
    medias = [medias;mean(generacionSemaforo),mean(generacionAceleracion)];
end

%plotear datos
%fitness maximo
figure;
hold on;
axis([0 21 0.7 1.0]);
for i=1:generaciones
    plot(i,maximos(i,1),'go');
    plot(i,maximos(i,2),'b*');
end
hold off;

%fitness medio
figure;
hold on;
axis([0 21 0.5 1.0]);
for i=1:generaciones
    plot(i,medias(i,1),'go');
    plot(i,medias(i,2),'b*');
end
hold off;

%frontera de pareto
figure;
hold on;
axis([0.75 1.0 0.995 1.0]);
unOctavo= round(tamPoblacion/8);
datosPareto = [];
for i=1:generaciones
    for j=1:unOctavo
        datosPareto = [datosPareto; datos(i,1+(j-1)*2),datos(i,j*2)];
    end
end
for i=1:size(datosPareto,1)
    esFrontera = 1;
    datoX = datosPareto(i,1);
    datoY = datosPareto(i,2);
    for j=1:size(datosPareto,1)
        if (datoX < datosPareto(j,1) && datoY < datosPareto(j,2) )
            esFrontera = 0;
           break; 
        end
    end
    if (esFrontera == 1)
        plot(datoX,datoY,'r*');
    else
        plot(datoX,datoY,'b*');
    end
end
hold off;