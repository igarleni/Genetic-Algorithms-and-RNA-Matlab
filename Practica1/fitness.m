function [fit] = Fitness(Pop, I) 
    L = size(Pop);
    for ind=1:L(1) 
        genes = Extractor_Genes(Pop(ind,:));
        ellipse = Ellipse_Generator(genes(1),genes(2),genes(3),genes(4),genes(5));
        cont = 0;
        siz = size(ellipse,1);
        ellipse = Delete_Repeated(ellipse);
        for i=1:size(ellipse,1)
            x = ellipse(i,1);
            y = ellipse(i,2);
            if(x > 100 || y > 100 || x < 1 || y < 1)
                continue;
            end    
            if (I(x,y) == 0) %positivo detectado
               cont = cont+1;
            end
        end
        fit(ind) = cont/siz;
    end
end