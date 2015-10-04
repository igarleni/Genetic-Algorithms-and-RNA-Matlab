function [pop] = MutarNGenes (pop, prob)
    L = length(pop);
    NGenes = prob*L;
    GenesMutar = [];
    
    for i=1:NGenes
        LGenesMutar = length(GenesMutar);
        GenMutar = randi([1, 29]);
        for j=1:LGenesMutar
            if GenMutar == GenesMutar(i)
                i = i-1;
                break;
            end
            if i == LGenesMutar
                GenesMutar = [GenesMutar, GenMutar];
                posiMutar = randi([1, 29]); %Calculamos el punto en el que mutará
                pop(i+1, posiMutar) = abs(pop(i+1, posiMutar) - 1) ;
            end
        
        end
        
    end
    