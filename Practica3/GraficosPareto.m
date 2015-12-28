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
%HASTA AQUI FUNCIONA
for i=1:generaciones
    generacionSemaforo = [];
    generacionAceleracion = [];
    for j=1:tamPoblacion
        generacionSemaforo =[generacionSemaforo;datos(i,1+(j-1)*2)];
        generacionAceleracion = [generacionAceleracion;datos(i,j*2)];
    end
    medias = [medias;mean(generacionSemaforo),mean(generacionAceleracion)]; % media de la tercera columna
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

