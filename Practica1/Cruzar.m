function [popHijo] = Cruzar (pop,outpopsize)

	%Paso 2 --> coger el primero y combinarlo con el primero de la segunda mitad, y así hasta la mitad de la población.
    popHijo = [];
    for i=1:outpopsize/2
        idx_papa = randi(size(pop,1));
        idx_mama = randi(size(pop,1));
        while idx_papa == idx_mama
           idx_mama = randi(size(pop,1));
        end
        ind1 = randi(29);
	    ind2 = randi(29);
        if ind1>ind2 
            aux = ind1;
            ind1 = ind2;
            ind2 = aux;
        end
        papa = pop(idx_papa,:);
        mama = pop(idx_mama,:);
        boy = [papa(1:ind1) mama(ind1+1:ind2) papa(ind2+1:29)];
        girl = [mama(1:ind1) papa(ind1+1:ind2) mama(ind2+1:29)];
        popHijo = [popHijo;boy;girl];
    end

end
