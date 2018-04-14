function yh = larx_predict(w, X, yo , cfg)
%w is the 1-dim weight vector: (xlags x channels + ylags + 1) x 1
%X is the 2-dim data matrix: channels x samples
%yo is the initial condition of the target

[d,T] = size(X);
xlags = cfg.xlags;
ylags = cfg.ylags;

yh = zeros(T,1);
st = max(xlags,ylags+1);
yh(1:st) = yo;

for i=(st+1):T
    Xtmp = X(:, (i - xlags + 1): i );
    Xtmp = Xtmp'; %convert to lags x channels
    ytmp = yh( (i - ylags ) : (i-1));
    yh(i) = larx_model(w, Xtmp, ytmp);     
end
