function y = my_sig(sigma,ctr,T)

x = 1:T;
y = exp(-(x-ctr).^2/sigma);

end

