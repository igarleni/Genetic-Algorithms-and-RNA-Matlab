function [Ah, Ao] = model(X, Wh, Wo, Bh, Bo)

    Ah = Wh * X + Bh;
    Ah = activationFunction(Ah);
    Ao = Wo * Ah + Bo;
    Ao = activationFunction(Ao);


end