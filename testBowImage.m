clc;clear;close all;
addpath('bow/');
addpath('learning/');
addpath('descripteurs/');
addpath('Scene/')

% pathBow = 'bows/';
% mat = 'sifts_and_clusters/clusters.mat';
% path_sifts = 'sifts_and_clusters/sifts/';
pathBow = 'allBOWS/';
mat = 'visualWords.mat';
path_sifts = 'descripteurs/allSifts/';

[I, nomim, sifts] = randomImageDes('Scene/', path_sifts);
load(mat);


[bow, nc] = computeBow(double(sifts)', bestCenters);
patchmin = visuDico(mat, 'Scene/', path_sifts);
visuBoW(I, patchmin , bow, nc, nomim);
