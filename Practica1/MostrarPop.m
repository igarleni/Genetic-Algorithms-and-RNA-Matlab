function [] = MostrarPop(pop, I)

        figure;

        imshow(I);
        hold on;
        imshow(I);
        axis equal;
        axis off;
        
        popSize = size(pop);
        for ind = 1:popSize(1)
            x0 = binario_a_entero (pop(ind,11:16)) + 19;
            y0 = binario_a_entero (pop(ind,17:22)) + 19;
            plot(x0,y0,'r.','MarkerSize',20);
        end
        
        hold off;
        cameratoolbar;
        
        pause(2);
        close;
        

end
