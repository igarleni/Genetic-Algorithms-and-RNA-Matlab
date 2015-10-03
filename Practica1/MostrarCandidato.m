function [] = MostrarCandidato(pop, I)

    figure;
    
    imagen = (imread(I));
    Nf = size(imagen,1);
    Nc = size(imagen,2);
    x1 = linspace(0,1,Nc);
    y1 = linspace(0,1,Nf)*Nf/Nc;
    [X,Y] = meshgrid(x1,y1);
    Z = zeros(Nf,Nc);
    C = double(imagen(:,:,1));

    hold on;
    surf(X,Y,Z,C);

    axis equal;
    axis off;
    whitebg('black');
    title(['Candidato! Generacion nº ', numGeneraciones]);
    
    %se pinta la elipse
    a = binario_a_entero (Pop(1,1:5)) + 5;
    b = binario_a_entero (Pop(1,6:10)) + 5;
    x0 = binario_a_entero (Pop(1,11:16)) + 19;
    y0 = binario_a_entero (Pop(1,17:22)) + 19;
    theta = binario_a_entero (Pop(1,23:29));
    theta = theta*179/127; %Escalamos de 0 a 127 a 0 a 179
    theta = theta * pi/180;
    
    plot(x0,y0,'*');
    for alpha=0.2:0.2:2*pi
        x = round( (a*cos(alpha)+x0)*cos(theta) + (b*sin(alpha)+y0)*sin(theta));
        y = round((a*cos(alpha)+x0)*sin(theta)+(b*sin(alpha)+y0)*cos(theta));
        plot(x,y,'*');
    end
    
    hold off;
    cameratoolbar;
end