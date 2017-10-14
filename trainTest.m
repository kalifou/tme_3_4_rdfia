function [ values ] = trainTest( train, test, y)
    % to comment
    model = svmtrain(y, train, '-c 1000 -t linear');
    [w,b] = getPrimalSVMParameters(model);
    values = sign(test*w  + b);
end

