function [aux,fit_ordenado] = OrdenaFitness(pop, fit)

    popOrden = [pop, fit];
    popOrden = sortrows(popOrden,-30);
    aux = popOrden(:, 1:29);
    fit_ordenado = popOrden(:,30);

end