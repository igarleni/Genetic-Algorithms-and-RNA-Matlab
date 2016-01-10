function [] = plotMSE(MSE)

x = 1:length(MSE);
figure;
hold on;
axis([1 max(x)+1 0 max(MSE)]);
plot(x,MSE,'-r*');

end