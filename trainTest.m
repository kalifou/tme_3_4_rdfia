function [ values, w ] = trainTest( train, test, y)
    % to comment
    model = svmtrain(y, train, '-c 1000 -t linear');
    [w,b] = getPrimalSVMParameters(model);
    values = -1 .* sign(test*w  + b);
end

