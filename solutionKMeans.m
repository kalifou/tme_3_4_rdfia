function [centers, error] = solutionKMeans(points, M)
    maxIter = 50;
    %Init centers randomly
    centers = randomSeed(points, M);
    
    iteration = 0;
    movecenters = 1;
    while(sum(movecenters) > 0)          
        %Compute MxN neighboor matrix 
        nc = assignementKMeans(points, centers);
        
        %Update centers
        [centers, error, movecenters] = miseAjourKMeans(points, centers, nc);
        
        iteration = iteration + 1;
        if iteration >= maxIter
            break;
        end
    end
    sprintf('KMeans done in %d iterations', iteration)
end