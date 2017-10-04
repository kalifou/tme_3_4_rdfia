addpath('bow');

[I, nomin, sifts] = randomImageDes('descripteurs/allSifts','Scenes');
load('visualWords.mat');
[bow, nc] = computeBow(sifts,bestCenters,False);
visuBoW( I , patchmin , bow , nc, nomim);
