function [ matConf , txCat ] = multiClassPrediction( predictclassifieurs , imCatTest)
    
    N_class = size(imCatTest,1);
    matConf = zeros(N_class,N_class);
    txCat = [];
    
    % For each classifier i
    for i=1:N_class        
        % What example has been properly classified by i 
        inter = predictclassifieurs(i,:)==1;
        % Calculate the percentage of proper classification 
        txCat = [txCat, sum(inter)/size(inter,2)];
   
    end
end

% Classification : pos must be updated using classes test (resp. train) length in
% imCat(resp.Test)