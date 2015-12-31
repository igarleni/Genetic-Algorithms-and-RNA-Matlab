function [fin] = main(maxGen, popSize, probMutacion)
    fin = 0;
    
    rutaImagen = 'elipse2.jpg';
    imagen = imread(rutaImagen);
    %%%Para tratar imágenes. Convierte en escala de grises
    %%% y calcula el gradiente
    %[Gmag, Gdir] = imgradient(imagen,'prewitt');
    %I = round(mat2gray(Gmag));
    %I = ~I; 
    %%%
    
    I = round(mat2gray(imagen));
    
    pop = Inicializa_poblacion(popSize);
    dos_tercios = round(popSize*2/6)*2;%dos tercios pares
    datos = [];
	
    for i=1:maxGen
        [fit] = fitness(pop,I);
        [pop,fit] = OrdenaFitness(pop, fit);
		%%recoger datos
		datos = [datos, fit];
        disp(fit(1));
        if fit(1) == 1
            break;
        end
        popHijo = [pop(1:2,:);Cruzar(pop(1:dos_tercios,:),popSize-2)]; %hacer cruce de cromosomas       
        popHijo = Mutar(popHijo, probMutacion); %escoger uno aleatorio y cambiarle un bit
        pop = popHijo;
		
    end
    
    fit = fitness(pop,I);
    [pop,fit] = OrdenaFitness(pop, fit);
	datos = [datos, fit];
	%recoger datos
    MostrarCandidato(pop, I);
	MostrarGrafica(datos);
end