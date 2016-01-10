function [] = main()
    %Carga de los ficheros
    [TrX, TrY, TeX, TeY] = loadAll();
    % Acotar el numero de elementos a usar para entrenar y evaluar la red
    trainAmount = 6000;
    TrX = TrX(:, 1:trainAmount);
    TrY = oneHot(TrY(1:trainAmount));
    TeX = TeX(:, 1:3000);
    TeY = oneHot(TeY(1:3000));
    
    [Wh, Bh, Wo, Bo, MSE] = train(TrX, TrY);
    test(Wh, Bh, Wo, Bo, TeX, TeY);
    plotMSE(MSE);

end