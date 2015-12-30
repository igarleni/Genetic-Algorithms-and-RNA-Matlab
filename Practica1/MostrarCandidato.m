function [] = MostrarCandidato(pop, I)

    figure;
    
    imshow(I);
    hold on;
    axis equal;
    axis off;
    
    %se pinta la elipse
    a = binario_a_entero (pop(1,1:5)) + 5;
    b = binario_a_entero (pop(1,6:10)) + 5;
    x0 = binario_a_entero (pop(1,11:16)) + 19;
    y0 = binario_a_entero (pop(1,17:22)) + 19;
    theta = binario_a_entero (pop(1,23:29));
    theta = theta*89/127; %Escalamos de 0 a 127 a 0 a 179
    theta = theta * pi/180;
    
    plot(y0,x0,'*');
    for alpha=0.2:0.2:2*pi
        x = round(((a*cos(alpha)).*cos(theta) - (b*sin(alpha)).*sin(theta)) +x0);
        y = round(((a*cos(alpha)).*sin(theta) + (b*sin(alpha)).*cos(theta)) +y0);
        plot(y,x,'r.');
    end
    
    hold off;
    cameratoolbar;
end