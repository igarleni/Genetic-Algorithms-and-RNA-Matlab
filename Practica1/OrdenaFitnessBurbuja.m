function [pop] = OrdenaFitness(pop, I)

    n=length(pop); 
    for i=1:n 
        for j=1:n-i 
            if pop(fitness(j, I))<pop(fitness(j+1, I)) 
                aux=pop(j); 
                pop(j)=pop(j+1); 
                pop(j+1)=aux; 
            end
        end
    end
end