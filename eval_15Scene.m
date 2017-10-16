% Script for Exercise 2
clc;clear;close all;
addpath('learning/');
addpath('learning/libsvm/matlab/');
addpath('descripteurs/');

% Load train & test datasets
pathBow = 'allBOWS/';
K= 1001;
nTrain = 100;
T = 10;

txCats=[];

% For T Splits :
for t= 1:T
    t
    [imCat , imCatTest] = NbImCatAllTest(pathBow,nTrain);
    [ train , test ] = loadData( nTrain , imCat , pathBow, K);

    % Loading labels
    predictclassifieurs =[];

    % For every category
    for i = 1:size(imCatTest,1)

        % Calculate the number of test labels
        ntest = imCatTest(i);

        % Collect the train & test labels
        [ y, ytest ] = labelsTrainTest( nTrain,ntest,imCat,i );

        % Fit & Evaluate the classifier i 
        [res_classif_i, ~] = trainTest( train, test, y);
        predictclassifieurs = [predictclassifieurs, res_classif_i.* ytest ];
    end

    % CHECK the values of the pred & confusion matrix : good enough ?!!
    predictclassifieurs = predictclassifieurs';
    [ matConf , txCat ] = multiClassPrediction( predictclassifieurs , imCatTest);

    txCats = [txCats;txCat];
end

% mean over T splits
meanTxCat = mean(txCats,1);
% Standard deviation over T splits
stdTxCat = std(txCats,1);

figure;
imagesc(matConf)
title("Matrice de confusion")
figure;
plot(meanTxCat)
xticks([1:15])
xticklabels({'bedro','CALsu','indus','kitch','livin','MITco','MITfo','MIThi','MITin','MITmo','MITtop','MITst','MITta','PARof','store'})
title("Taux de reconnaissance par carégorie")


