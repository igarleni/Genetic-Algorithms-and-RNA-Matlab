function [binY] = oneHot(Y)

    binY = zeros(length(Y), 10);
    for i = 1:length(Y)
       
        binY(i, Y(i)+1) = 1;
    end

end