clc;clear;close all;
addpath('bow/');
addpath('learning/');
addpath('descripteurs/');
addpath('Scene/')

[I, nomim, sifts] = randomImageDes('Scene/', 'descripteurs/allSifts/');
load('visualWords.mat');
[bow, nc] = computeBow(double(sifts)', bestCenters);
patchmin = visuDico('visualWords.mat', 'Scene/', 'descripteurs/allSifts/');
visuBoW(I, patchmin , bow, nc, nomim);
