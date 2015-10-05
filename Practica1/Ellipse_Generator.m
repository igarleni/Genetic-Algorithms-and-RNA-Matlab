function [ellipse] = Ellipse_Generator(a,b,x0,y0,theta)
    ellipse = [];
        for alpha=0:0.1:2*pi
            x = round((a*cos(alpha)*cos(theta) - b*sin(alpha)*sin(theta)))+x0;
            y = round((a*cos(alpha)*sin(theta) + b*sin(alpha)*cos(theta)))+y0;
            ellipse = [ellipse; x y];
        end
end