function yh = larx_model(w, X, y)
%w is the 1-dim weight vector: (xlags x channels + ylags + 1) x 1
%X is the 2-dim data matrix: lags x channels
%y is the 1-dim lagged estimates of yh: lags2 x 1

z = [X(:) ; y ; 1];
try
    yh = sigmoid(z'*w);
catch
    disp('err: larx_model!!!')
end
end