function [fit] = fitness(Pop, I) %Asumiendo valores positivos
    L = size(Pop);
    for ind=1:L(1) %Cogemos el siguiente individuo
        a = binario_a_entero (Pop(ind,1:5)) + 5;
        b = binario_a_entero (Pop(ind,6:10)) + 5;
        x0 = binario_a_entero (Pop(ind,11:16)) + 19;
        y0 = binario_a_entero (Pop(ind,17:22)) + 19;
        theta = binario_a_entero (Pop(ind,23:29));
        theta = theta*179/127; %Escalamos de 0 a 127 a 0 a 179
        theta = theta * pi/180;
        
        elipse = [];
        falloElipse = 0;
        for alpha=0.2:0.2:2*pi
        x = round((a*cos(alpha)).*cos(theta) - (b*sin(alpha)).*sin(theta) +x0);
        y = round((a*cos(alpha)).*sin(theta) + (b*sin(alpha)).*cos(theta) +y0);
            if ( 0>=x || x>100 || 0>=y || y>100 )
                falloElipse = 1;
                break;
            end
            elipse = [elipse; x y];
        end
        
        %comprobamos el matching con la imagen
        if (falloElipse)
            fit(ind, 1) = 0;
        else
            contador = 0;
            for i=1:size(elipse,1)
                if (I(elipse(i,1),elipse(i,2))== 1) %positivo detectado
                   contador = contador+1;
                end
            end
            fit(ind, 1) = contador/size(elipse,1);
        end
    end
end