%Return M x N distance matrix
%given listPts (Nxd) and centres (Mxd)
function nc = assignementKMeans(listPts, centers)
    nc = -2 .* (centers * listPts') + sum(listPts.^2,2)' + sum(centers.^2,2);


end