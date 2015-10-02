function [fin] = main(I , popSize)
    fin = 0;
    
    pop = Inicializa_poblacion(popSize);
    pop = OrdenaFitness(pop, I);
    
    while (EvaluarEstado(pop)) %si el primero cumple las condiciones, exit while
        pop = Seleccionar(pop); %seleccionar 2/3 mejores
        Mostrarpop.MostrarPadre(pop);
        
        popHijo = Cruzar(pop); %hacer cruce de cromosomas
        MostrarPob.MostrarHijos(pop);
        
        popHijo = Mutar(popHijo); %escoger uno aleatorio y cambiarle un bit
        MostrarPob.MostrarMutado(cromosomaMutado);
        
        OrdenaFitness(popHijo, I); %ordenar la nueva población

        pop = popHijo;
    end
    
end