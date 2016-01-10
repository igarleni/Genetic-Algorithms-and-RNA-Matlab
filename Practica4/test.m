function [globalAssert, numbersAssert] = test(Wh, Bh, Wo, Bo, TeX, TeY)

[~,nElemT] = size(TeX);
globalAssert = zeros(2,1);
numbersAssert = zeros(2, 10);
   for i = 1:nElemT
        [~, Ao] = model(TeX(:,i),Wh, Wo,Bh, Bo);
        Y = oneHotToDec(TeY(i,:));
        
        numbersAssert(1,Y+1) =  numbersAssert(1,Y+1)+1;
        globalAssert(1,1) = globalAssert(1,1) + 1;
        
        if(oneHotToDec(Ao')== Y)
           numbersAssert(2,Y+1) =  numbersAssert(2,Y+1)+1;
           globalAssert(2,1) = globalAssert(2,1) + 1;
        end
   end
   
   fprintf('Porcentaje de acierto global: %f %% de %d elementos. \n', (100/globalAssert(1,1)*globalAssert(2,1)), globalAssert(1,1));
   fprintf('-----------------------------\n');
   fprintf('Cero: %f %% de %d elementos.\n', (100/numbersAssert(1,1)*numbersAssert(2,1)), numbersAssert(1,1));
   fprintf('Uno: %f %% de %d elementos.\n', (100/numbersAssert(1,2)*numbersAssert(2,2)), numbersAssert(1,2));
   fprintf('Dos: %f %% de %d elementos.\n', (100/numbersAssert(1,3)*numbersAssert(2,3)), numbersAssert(1,3));
   fprintf('Tres: %f %% de %d elementos.\n', (100/numbersAssert(1,4)*numbersAssert(2,4)), numbersAssert(1,4));
   fprintf('Cuatro: %f %% de %d elementos.\n', (100/numbersAssert(1,5)*numbersAssert(2,5)), numbersAssert(1,5));
   fprintf('Cinco: %f %% de %d elementos.\n', (100/numbersAssert(1,6)*numbersAssert(2,6)), numbersAssert(1,6));
   fprintf('Seis: %f %% de %d elementos.\n', (100/numbersAssert(1,7)*numbersAssert(2,7)), numbersAssert(1,7));
   fprintf('Siete: %f %% de %d elementos.\n', (100/numbersAssert(1,8)*numbersAssert(2,8)), numbersAssert(1,8));
   fprintf('Ocho: %f %% de %d elementos.\n', (100/numbersAssert(1,9)*numbersAssert(2,9)), numbersAssert(1,9));
   fprintf('Nueve: %f %% de %d elementos.\n', (100/numbersAssert(1,10)*numbersAssert(2,10)), numbersAssert(1,10));
   
end