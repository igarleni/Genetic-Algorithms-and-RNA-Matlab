function [pop] = Mutar (pop, prob)
    L = size(pop,1);
    for i=1:L
        if(rand(1) <= prob) %Si toca un n� por debajo o igual a la prob de mutar, muta
            posiMutar = randi([1, 29]); %Calculamos el punto en el que mutar�
            %Accedemos al cromosoma posiMutar del gen en la posici�n i
            %Si hay un 0 => abs(0-1)-->abs(-1)=1, Si hay un 1 => abs(1-1), abs(0) = 0
            pop(i, posiMutar) = abs(pop(i, posiMutar) - 1);             
                
        end
    end
end