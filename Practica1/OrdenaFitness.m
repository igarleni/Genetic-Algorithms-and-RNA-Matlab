function [popOrden] = OrdenaFitness(pop, I)
    popOrden = [];
    popAux = [];
    if(fitness(pop(1,:),I) > fitness(pop(2,:),I))
        popOrden = [pop(1,:); pop(2,:)];
    else
        popOrden = [pop(2,:); pop(1,:)];
    end
    L = length(pop);
    
    for i=2:L
        LPopOrden = length(popOrden);
        for j=1:popOrden
            if (fitness(popOrden(i,:), I) > fitness(popOrden(j,:), I)) %positivo detectado
                if(j == 1)
                    popOrden = [pop(i,:); popOrden];
                    break;
                else
                    popAux = popOrden(j:LPopOrden, :);
                    popOrden = [popOrden(1:j-1,:); pop(i,:); popAux]; 
                    break;
                end
            else
                if( j == LPopOrden)
                    popOrden = [popOrden; pop(i)];
                end
            end
        end   
    end
end