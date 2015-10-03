function [] = MostrarPop(pop, I, numGeneraciones)

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
        title(['Generacion nº ', numGeneraciones]);
        
        popSize = size(pop);
        for ind = 1:popSize(1)
            x0 = binario_a_entero (Pop(1,11:16)) + 19;
            y0 = binario_a_entero (Pop(1,17:22)) + 19;
            plot(x0,y0,'*');
        end
        
        hold off;
        cameratoolbar;
        
        pause(2);
        close;
        

end
