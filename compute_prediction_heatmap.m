function hmap=compute_prediction_heatmap(I, nc, w)
    s = 16;
    hmap = double(zeros(size(I)));
    r = denseSampling(I,16,8);
    N_samples = size(r,2);
    for i=1:N_samples 
        xi = r(1,i);
        yi = r(2,i);
        bla = nc(i,:);
        b = w / N_samples + zeros(16 , 16);
        hmap(xi:xi+15,yi:yi+15) = b;
    end

end