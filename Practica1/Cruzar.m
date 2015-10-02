function [popHijo] = Cruzar (pop, numSize)

    %Paso 1 -->Guardar la élite, los 5 primeros
	popHijo = [];
	popHijo = [popHijo; pop(1:5,:);

	%Paso 2 --> coger el primero y mezclarlo con el segundo, y así hasta la mitad de la población.
	
	%Paso 3 --> coger y cruzar randoms hasta llegar a numSize
end