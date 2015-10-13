function [fin] = main(rutaImagen , maxGen, minFitness)
    fin = 0;
    
    minFitness = 0.8;
    rutaImagen = 'Assorted_United_States_coins_contraste_alto_Gray_Scale.jpg';
    imagen = imread(rutaImagen);
    [Gmag, Gdir] = imgradient(imagen,'prewitt');
    I = round(mat2gray(Gmag));
    
    pop = Inicializa_poblacion(100);
    pop = OrdenaFitness(pop, I);
    probMutacion = 0.07;
    
    numeroGeneraciones = 1;
    MostrarPop(pop, I);

    while (EvaluarEstado(pop, minFitness, I) && (numeroGeneraciones >= maxGen)) %si el primero cumple las condiciones o si hay muchas generaciones, exit while
        pop = pop(1:70,:); %seleccionar 2/3 mejores
        
        popHijo = Cruzar(pop); %hacer cruce de cromosomas
        
        popHijo = Mutar(popHijo, probMutacion); %escoger uno aleatorio y cambiarle un bit
        popHijo = [popHijo; Inicializa_poblacion(25)]; %Se rellenan los 25 que faltan para llegar a 100
        
        OrdenaFitness(popHijo, I); %ordenar la nueva población

        pop = popHijo;
        
        numeroGeneraciones = numeroGeneraciones + 1;
        MostrarPop(pop, I);
        
    end
    MostrarCandidato(pop, I);
    
end