function [ values ] = trainTest( train, test, y)

    model = svmtrain(y, train, '-c 1000 -t linear');
    [w,b] = getPrimalSVMParameters(model);
    values = test*w  + b;
end

