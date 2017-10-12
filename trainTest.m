function [ values ] = trainTest( train, test, y)

% addpath('Scene/')
% addpath('allBOWS/');
    model = svmtrain(y, train, '-c 1000 -t linear');
    [w,b] = getPrimalSVMParameters(model);
    values = test*w  + b;
end

