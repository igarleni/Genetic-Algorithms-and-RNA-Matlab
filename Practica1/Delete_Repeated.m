function [ellipse]=Delete_Repeated(ellipse)
    k=1;
    n=length(ellipse);
    while k<n
        j=k+1;
        while j<=n
            if (ellipse(k,1)==ellipse(j, 1) && ellipse(k,2)==ellipse(j, 2))
                ellipse(j,:)=[];
                n=length(ellipse);
            else
                j=j+1;
            end
        end
        k=k+1;
    end
end