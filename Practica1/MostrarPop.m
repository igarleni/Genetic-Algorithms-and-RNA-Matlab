function [] = MostrarPop(pop, I, numGeneraciones)

        figure;

        hold on;
        imshow(I);
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
