function [fin] = main(rutaImagen , maxGen, minFitness, popSize)
    fin = 0;
    
    minFitness = 0.8;
    rutaImagen = 'elipse2.jpg';
    imagen = imread(rutaImagen);
    %[Gmag, Gdir] = imgradient(imagen,'prewitt');
    %I = round(mat2gray(Gmag));
    %I = ~I; 
    I = round(mat2gray(imagen));
    pop = Inicializa_poblacion(popSize);

    probMutacion = 1/popSize;
    dos_tercios = round(popSize*2/6)*2;%dos tercios pares

    for i=1:maxGen
        [fit] = fitnessCarla(pop,I);
        [pop,fit] = OrdenaFitness(pop, fit);
        disp(fit(1));
        popHijo = [];
        popHijo = [pop(1:2,:);Cruzar(pop(1:dos_tercios,:),popSize-2)]; %hacer cruce de cromosomas       
        popHijo = Mutar(popHijo, probMutacion); %escoger uno aleatorio y cambiarle un bit
        pop = popHijo;
        
    end
    fit = fitnessCarla(pop,I);
    [pop,fit] = OrdenaFitness(pop, fit);
    MostrarCandidato(pop, I);
    
end