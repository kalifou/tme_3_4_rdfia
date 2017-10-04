clc;close all;clear;

%Number of visual words
M = 1000;

%Randomly collect SIFTS
[points, norms] = randomSampling('allSifts/');

%Try several kmeans inits to find best centers
bestCentersError = inf;
bestCenters = -1;
for i = 1:5
[currentCenters, error] = solutionKMeans(points, M);
if(error < bestCentersError)
    bestCentersError = error;
    bestCenters = currentCenters;
end
end

%Add null vector to visual words
bestCenters = [bestCenters; zeros(1,128)];

%Save centers for subsequent classification
save('visualWords','bestCenters');
%{
%Run this to see what assignmentKMeans returns on a simple example 
a = [1 1 ; 0 0 ; 2 2 ; 5 5]
b =  [0 1 ; 4 4]
test = assignementKMeans(a,b)
%}