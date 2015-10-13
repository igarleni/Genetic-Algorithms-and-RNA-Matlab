function [popOrden] = OrdenaFitness(pop, I)

    popOrden = [pop, fitnessCarla(pop, I)];
    popOrden = sortrows(popOrden,-30);
    popOrden = popOrden(:, 1:30);
end