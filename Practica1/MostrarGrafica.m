function [] = MostrarGrafica(datos)
	popSize = size(datos,2);
	
	
	%sacar datos
	maximos = datos(1,:);
	medias = [];
	for i=1:popSize
		generacion = datos( : , i); 
		medias = [medias,mean(generacion)];
	end
	
	%plotearlos
	figure;
	hold on;
	axis([0 popSize 0 1.0]);
	for i=1:popSize
		plot(i,medias(i),'bo');
	end
	for i=1:popSize
		plot(i,maximos(i),'r*');
	end
end