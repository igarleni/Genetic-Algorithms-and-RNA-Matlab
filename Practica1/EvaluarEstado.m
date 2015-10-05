function [cond] = EvaluarEstado(pop, minFitness, I)
    cromosomaLider = pop(1,:);
    fit = fitness(cromosomaLider,I);
    
    if (fit(1) > minFitness)
        cond = 1;
    else
        cond = 0;
    end
    
end