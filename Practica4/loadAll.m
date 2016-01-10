function [numTrain, labelTrain, numTest, labelTest] = loadAll()

    fileNumbersTrain = 'train-images.idx3-ubyte';
    fileLabelsTrain = 'train-labels.idx1-ubyte';
    fileNumbersTest = 't10k-images.idx3-ubyte';
    fileLabelsTest = 't10k-labels.idx1-ubyte';
    
    %Cargamos conjunto de entrenamiento
    numTrain = loadMNISTImages(fileNumbersTrain);
    labelTrain = loadMNISTLabels(fileLabelsTrain);
    %Cargamos conjunto de test
    numTest = loadMNISTImages(fileNumbersTest);
    labelTest = loadMNISTLabels(fileLabelsTest);

end