function [ matConf , txCat ] = multiClassPrediction( predictclassifieurs , imCatTest)
    
    N_class = size(imCatTest,1);
    matConf = zeros(N_class,N_class);
    txCat = [];
    
    % For every class i
    for i=1:N_class
        idx = 1;
        
        % Vect of predictions by classifier i
        pred_i = predictclassifieurs(i,:);
        
        % For every class j
        for j=1:N_class
            % number of observations in the class j
            n_j =  imCatTest(j);
        
            % percentage of correct classification for class j of N = n_j
            % elements, by model i
            perc_j = sum( pred_i(idx:idx+n_j-1) == 1) / n_j;
            matConf(i,j) = perc_j;
            if i==j
                txCat = [txCat, perc_j ];
            end
            
            % position  iterator for next class's obervations
            idx = idx + n_j;
        end
    end
    %matConf =matConf/ norm(matConf);
end