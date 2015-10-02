function [fin] = main()
    fin = 0;
    
    pop = Inicializa_poblacion(100);
    pop = OrdenaFitness(pop, i);
    
    while (EvaluarEstado(pop)) %si el primero cumple las condiciones, exit while
        pop = Seleccionar(pop); %seleccionar 2/3 mejores
        Mostrarpop.MostrarPadre(pop);
        
        popHijo = Cruzar(pop); %hacer cruce de cromosomas
        Mostrarpop.MostrarHijos(pop);
        
        cromosomaMutado = Mutar(popHijo); %escoger uno aleatorio y cambiarle un bit
        Mostrarpop.MostrarMutado(cromosomaMutado);
        
        OrdenaFitness(popHijo, I); %ordenar la nueva poplación
        pop = popHijo;
    end
    
end