function [newWeight, errorArray] = training(numTrain, labelTrain, weightMatrix)
    %nElem es el numero de columnas de numTrain(numero de elementos a entrenar)
    [~, nElem]= size(numTrain);
    %nNeural es el numero de filas de weightMatrix(numero de neuronas en la
    %capa oculta) ESTO HAY QUE CAMBIARLO CUANDO CAMBIEMOS LA ARQUITECTURA
    [nNeural, nLinks] = size(weightMatrix);
    nCapes = round(nLinks/784);
    errorArray = [];
    
%---BUCLE QUE RECORRE TODOS LOS ELEMENTOS DE ENTRENAMIENTO
    for elem=1:nElem
        %Añado el elemento a fi para que sea mas facil de programar el bucle 
        fi = [];
        fi(:,1) = numTrain(:,1);

        %Capa oculta
            %Bucle para calcular sumatorios de w*x(da un escalar) en las capas
            % ocultas y aplicarles la funcion de activación correspondiente

        for cape = 1:nCapes
            for neural=1:(nNeural-1)
                    fi(neural,cape+1) = weightMatrix(neural,1:nNeural-1)*fi(1:nNeural-1, cape);
                    fi(neural,cape+1) = activationFunction(fi(neural,cape+1));
            end
        end

    %Capa de salida
        [~, nInputFinalCape] = size(fi)
        %Multiplicamos el vector de entradas por una matriz columna 1 para
        %forzar el sumatorio de todos los elementos en un escalar,
        %posteriormente aplicamos la funcion de activacion a ese resultado.
        
       %---------PARA SOLO UNA SALIDA
        result = (fi(:,nInputFinalCape)')*weightMatrix(:,nInputFinalCape);
        result = activationFunction(result);

    %Cálculo del error
        %Necesariamente acotamos el label correspondiente a la imagen del 
        %entrenamiento a un valor entre 0 y 1, dividiendo el label entre 10
        label = labelTrain(elem,1)/10;
        errorArray(elem) = label - result; 
        errorElem = errorArray(elem);

    %Backpropagation
        %Creamos la nueva matriz de pesos
        newWeight = ones(nNeural, nLinks);
        [row, column] = size(fi);
        %Creamos nueva matriz de acumulacion de errores
        errorMatrix = ones(row, column);
        %Error en la capa de salida
        errorMatrix(:,column) = result;
        errorMatrix(:,column-1) = errorElem*weightMatrix(:,nNeural);
        %Error en las capas ocultas
       
        %for cape = nCapes:-1:1
            %for i = nNeural-1:-1:1
              %  errorMatrix(i,cape) = weightMatrix(i,1:nNeural-1)*errorMatrix(cape,i)*ones(nNeural-1, 1);
          %  end
       % end
       
               %for cape = 1:nCapes
           %for i=1:(nNeural-1)
            %    errorMatrix(i,cape) = weightMatrix(i,1:nNeural-1)*errorMatrix(1:nNeural-1,i);
           % end
       % end   
        %Creamos la nueva matriz de pesos con la formula w' = w+nd(df/de)x
        %La derivada de la sigmoide es y' = y(1-y)
        
        %Capas ocultas
 
        for cape = 1:nCapes
            for neural = 1:nNeural-1
                for link = 1: nLinks-1
                    fi
                    newWeight(neural, link) = weightMatrix(neural, link) + (0.2) * errorMatrix(neural,cape) * fi(neural,cape+1)*(1-fi(neural,cape+1))*fi(neural,cape);
                end
            end
        end
    %Ultima capa 

        for neural = 1: nNeural
            newWeight(neural, nLinks) =  weightMatrix(neural, nLinks) + (0.2) *(errorMatrix(neural,column) * fi(neural,nCapes)*(1-(fi(neural,nCapes))))*result;
        end
        weightMatrix = [];
        weightMatrix = newWeight;
    end
    %errorArray(:,:)
end