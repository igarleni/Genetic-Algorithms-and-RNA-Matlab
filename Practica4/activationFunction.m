function [sigmoid] = activationFunction(x)
        sigmoid = sigmf(x./100, [1 0]);
end