function [newcenters, error, movecenters] = miseAjourKMeans(listPts, centers, nc)
%get number of centers
K = size(centers,1);

%get cluster centers by computing their mean point

newcenters = zeros(size(centers));
nbPointsInCluster = zeros(K,1);
error = 0;
for i = 1:size(listPts,1)
    %STEP 1 find nearest cluster of point
    [~,cInd] = min(nc(:,i),[],1);
    
    %accumulate point
    newcenters(cInd,:) = newcenters(cInd,:) + listPts(i,:);
    nbPointsInCluster(cInd) = nbPointsInCluster(cInd) + 1;
    
    %accumulate error
    error = error + nc(cInd,i);
end
%compute new centers
newcenters = newcenters ./ max(1,nbPointsInCluster);

movecenters = zeros(K,1);
%compute difference with old centers
for i = 1:K
   movecenters(i) = norm(centers(i,:) - newcenters(i,:));
end
end