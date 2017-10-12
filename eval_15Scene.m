% Script for Exercise 2
clc;clear;close all;
addpath('learning/');
addpath('learning/libsvm/matlab/');
addpath('descripteurs/');
% addpath('Scene/')
% addpath('allBOWS/');
% Load train & test datasets
pathBow = 'allBOWS/';
K= 1001;
nTrain = 100;
[imCat , imCatTest] = NbImCatAllTest(pathBow,nTrain);

[ train , test ] = loadData( nTrain , imCat , pathBow, K);

% Loading labels
predictclassifieurs =[];

for i=1:size(imCatTest)
    ntest=imCatTest(i);
    [ y, ytest ] = labelsTrainTest( nTrain,ntest,imCat,i );
    % how to eval the class predicted by a classifier ?!
    predictclassifieurs = [predictclassifieurs, (trainTest( train, test, y) .* ytest)==1 & ytest == 1 ];
end
predictclassifieurs = predictclassifieurs';
% TODO : QU-3) 
[ matConf , txCat ] = multiClassPrediction( predictclassifieurs , imCatTest);
