clc;clear;close all;
addpath('learning/');
addpath('learning/libsvm/matlab/');
addpath('descripteurs/');
addpath('bow/');
addpath('Scene/')

% STEP 1: Train a classifier on a specific split using loadData2

% Load train & test datasets
pathBow = 'allBOWS/';
mat = 'visualWords.mat';
path_sifts = 'descripteurs/allSifts/';

K= 1001;
nTrain = 100;

% For a specific T Splits :
[imCat , imCatTest] = NbImCatAllTest(pathBow,nTrain);
[ train , test ] = loadData2( nTrain , imCat , pathBow, K);

Ws = [];
% For every category
for i = 1:size(imCatTest,1)

    % Calculate the number of test labels
    ntest = imCatTest(i);

    % Collect the train & test labels
    [ y, ytest ] = labelsTrainTest( nTrain,ntest,imCat,i );

    % Fit & Evaluate the classifier i 
    [res_classif_i, w] = trainTest( train, test, y);
    predictclassifieur = res_classif_i.* ytest;
    
    % Store weights of this predictor
    Ws = [Ws, w];
end

% STEP 2: select random image and gather variables needed to compute heatmap

% Load dictionnary
load(mat)

% Load image and sifts
[I, nomim, sifts] = randomImageDes('Scene/', path_sifts);
sifts = double(sifts);
% Compute distance matrix
nc = assignementKMeans(sifts', bestCenters);

% Get class number to extract corresponding w weights in SVM
cate = categories();
pos = strfind(nomim,'-');
classNb = find(strcmp(cate, nomim(1:pos-1)));
w = Ws(classNb);

% STEP 3: Compute and visualize heatmap
patchmin = visuDico(mat, 'Scene/',path_sifts );

hmap = compute_prediction_heatmap(I, nc,Ws);
visuHeatMap(I,nc,w,hmap,patchmin,nomim);


