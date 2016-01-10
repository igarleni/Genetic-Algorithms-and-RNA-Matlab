function [binY] = oneHotToDec(Y)
    binY= 0;
    maxValue = 0;
    for i = 1:length(Y)
        if (Y(1,i) > maxValue)
            binY = i-1;
            maxValue = Y(1,i);
        end
    end
end