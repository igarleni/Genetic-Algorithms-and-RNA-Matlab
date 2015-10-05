function [popOrden] = OrdenaFitness(pop, I)
    popOrden = [];
    popAux = [];
    if(fitnessCarla(pop(1,:),I) > fitnessCarla(pop(2,:),I))
        popOrden = [pop(1,:); pop(2,:)];
    else
        popOrden = [pop(2,:); pop(1,:)];
    end
    L = size(pop);
    
    for i=2:L
        LPopOrden = size(popOrden);
        for j=1:popOrden
            if (fitnessCarla(pop(i,:), I) > fitnessCarla(popOrden(j,:), I))
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