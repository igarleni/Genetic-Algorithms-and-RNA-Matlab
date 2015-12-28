clear all
datos = [];
datos = csvread('DatosFitness.txt');

generaciones = size(datos,1);
tamPoblacion = size(datos,2)-1;
datos = datos(:,1:tamPoblacion); %borrar ultima columna de ceros

%calculo del fitness medio y maximo por generacion
medias = [];
maximos = datos(:,1);
for i=1:generaciones
    generacion = datos( i , :); % todas las filas de la tercera columna 
    medias = [medias;mean(generacion)]; % media de la tercera columna
end

%plotear datos
figure;
hold on;
axis([0 21 0.7 1.0]);
for i=1:generaciones
    plot(i,maximos(i),'o');
end
hold off;

figure;
hold on;
axis([0 21 0.5 1.0]);
for i=1:generaciones
    plot(i,medias(i),'o');
end
hold off;