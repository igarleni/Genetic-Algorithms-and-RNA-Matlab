function [popHijo] = Cruzar (pop)

    %Paso 1 -->Guardar la élite, los 5 primeros
	popHijo = [];
	popHijo = [popHijo; pop(1:5,:)];

	%Paso 2 --> coger el primero y combinarlo con el primero de la segunda mitad, y así hasta la mitad de la población.
	popSize = size(pop);
    popSize = popSize(1)/2;
	for ind=1:popSize
		cromosomas = Combinar(pop(ind,:),pop(ind+popSize,:));
		popHijo = [popHijo; cromosomas];
	end
end

function [hijos] = Combinar (padre, madre)
	rng(0,'twister');
	ind1 = round(25*rand(1)+2);
	ind2 = round((28-ind1)*rand(1)+ind1);
	hijos = [];
	hijos = [[padre(1:ind1) madre(ind1+1:ind2) padre(ind2+1:29)]; [madre(1:ind1) padre(ind1+1:ind2) madre(ind2+1:29)]];
	
end