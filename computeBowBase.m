clc;clear;close all;
addpath('bow');
addpath('bow/');
addpath('learning/');
addpath('descripteurs/');

cate = categories();

%image folder 
pathim = 'Scene/';

%sifts folder
baseDirDes = 'descripteurs/allSifts/'

%future folder for BoWs 
pathdes = 'allBOWS/';

%load SIFT dictionnary
load('visualWords.mat');

s= 16;
delta = 8;

catinit = 1;
catend =15;

for index=catinit:catend
    cat = cate{index};
    %Create destination folder if not already existent
    pathcat = strcat(pathdes,cat,'/');
    if(exist(pathcat)==0)
        mkdir(pathcat);
    end
    
    tstarttot= tic;

    direc = strcat(pathim,cat,'/');
    listima=dir([direc '*.jpg'] );
    n=length(listima);
       
    %For each image
    for num=1:n
        if(num<10)
            nom = strcat('/image_000',num2str(num));
        elseif(num<100)
            nom = strcat('/image_00',num2str(num));
        else
            nom = strcat('/image_0',num2str(num));
        end
        %Open image
        imageName = strcat(direc,listima(num).name);
        I = imread(imageName);
        
        %Open corresponding sifts
        siftsName = strcat(baseDirDes,cat,nom,'.mat');
        load(siftsName);
        
        %Compute image's BoW
        [bow, nc] = computeBow(double(sifts)', bestCenters);
        
        %Store BoW
        desname = strcat(pathcat,listima(num).name(1:length(listima(num).name)-4),'.mat');
        save(desname,'bow');

    end
    tcaltot = toc(tstarttot);
    strcat('computation time for category :',cat,' =',num2str(tcaltot))    
end