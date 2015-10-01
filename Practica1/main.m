function [fin] = main()
    fin = 0;
    
    pop = Inicializa_poblacion(100);
    pop = OrdenaFitness(pop);
    
    while (evaluarEstado(pop)) %si el primero cumple las condiciones, exit while
        pop = Seleccionar(pop); %seleccionar 2/3 mejores
        MostrarPob.MostrarPadre(pop);
        
        popHijo = Cruzar(pop); %hacer cruce de cromosomas
        MostrarPob.MostrarHijos(pop);
        
        cromosomaMutado = Mutar(popHijo); %escoger uno aleatorio y cambiarle un bit
        MostrarPob.MostrarMutado(cromosomaMutado);
        
        OrdenaFitness(popHijo); %ordenar la nueva población
        pop = popHijo;
    end
    
end