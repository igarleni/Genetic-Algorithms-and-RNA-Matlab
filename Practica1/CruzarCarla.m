function [Pop]=Cruzar(pop)
    Pop = [];
    Pop = [Pop; pop(1:5)];
    i = 6;
        

    for j=1:2:70
        
        lim1 = randi([2, 28]);
        lim2 = lim1;
        while(lim1 == lim2)
            lim2 = randi([2, 28]);
        end
        if(lim1 > lim2)
            aux = lim1;
            lim1 = lim2;
            lim2 = aux;
        end 
        
        
        Pop(i) = [pop(j, 1:lim1);pop(j+1, lim1+lim2);pop(j, lim2+1:29)];
        Pop(i+1) = [pop(j+1, 1:lim1);pop(j, lim1+lim2);pop(j+1, lim2+1:29)];
        i = i+2;
    end
    
    
    Pop = [Pop; Inicializa_poblacion(25)];
    Pop = OrdenaFitness(Pop, I);
    
    
end