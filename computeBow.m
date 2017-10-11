function [bow,nc] = computeBow(sifts, clusters)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    % N * M ~ H
    nc = assignementKMeans(sifts,clusters);
    bow = zeros(size(nc));
    
    for i = 1:size(sifts,1)
    %STEP 1 find nearest cluster of point
        [~,cInd] = min(nc(:,i),[], 1);

        %create a one-hot vector
        bow(cInd,i) = 1;
    end
    
    % Sum 
    bow = sum(bow,2);
    % L1 normalizing
    bow = bow ./ norm(bow,1);
    
end