function [fin] = main()
    fin = 0;
    
    pob = Inicializa_poblacion(100);
    ordenaFitness(pob);
    
    while (evaluarEstado(pob)) %si el primero cumple las condiciones, exit while
        pob = Seleccionar(pob); %seleccionar 2/3 mejores
        MostrarPob.mostrarPadre(pob);
        
        pobHijo = cruzar(pob); %hacer cruce de cromosomas
        MostrarPob.mostrarHijos(pob);
        
        cromosomaMutado = mutar(pobHijo); %escoger uno aleatorio y cambiarle un bit
        MostrarPob.MostrarMutado(cromosomaMutado);
        
        ordenaFitness(pobHijo); %ordenar la nueva población
        pob = pobHijo;
    end
    
end