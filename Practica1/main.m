function [fin] = main(I , popSize)
    fin = 0;
    
<<<<<<< HEAD
    pop = Inicializa_poblacion(popSize);
    pop = OrdenaFitness(pop, I);
=======
    pop = Inicializa_poblacion(100);
    pop = OrdenaFitness(pop, i);
>>>>>>> origin/master
    
    while (EvaluarEstado(pop)) %si el primero cumple las condiciones, exit while
        pop = Seleccionar(pop); %seleccionar 2/3 mejores
        Mostrarpop.MostrarPadre(pop);
        
<<<<<<< HEAD
        popHijo = Cruzar(pop, popSize); %hacer cruce de cromosomas
        MostrarPob.MostrarHijos(pop);
        
        popHijo = Mutar(popHijo); %escoger uno aleatorio y cambiarle un bit
        MostrarPob.MostrarMutado(cromosomaMutado);
        
        OrdenaFitness(popHijo, I); %ordenar la nueva población
=======
        popHijo = Cruzar(pop); %hacer cruce de cromosomas
        Mostrarpop.MostrarHijos(pop);
        
        cromosomaMutado = Mutar(popHijo); %escoger uno aleatorio y cambiarle un bit
        Mostrarpop.MostrarMutado(cromosomaMutado);
        
        OrdenaFitness(popHijo, I); %ordenar la nueva poplación
>>>>>>> origin/master
        pop = popHijo;
    end
    
end