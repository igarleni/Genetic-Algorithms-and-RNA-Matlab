function [newPop] = Seleccionar (pop)
    tam = size(pop);
    newTam = tam(1)*2/3;
    newPop = [];
    for ind=1:newTam
        newPop = [newPop; pop(ind,1:29)];
    end
end