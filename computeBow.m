[bow,nc] = computeBow(sifts, clusters, matNormClusters)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    % N * M ~ H
    nc = assignementKMeans(sifts,clusters);
    
    listPts = sifts;
    for i = 1:size(listPts,1)
    %STEP 1 find nearest cluster of point
        [~,cInd] = min(nc(:,i),[], 1);

        %create a one-hot vector
        nc(:,i) = zeros(size(nc(:,i)));
        nc(cInd,i) = 1;
    end
    
    % Sum 
    bow = sum(nc,2);
    % L1 normalizing
    bow = b /norm(bow,1);
    
end

