%% random data test

n = 10; 
T = 100;
d = 5;

data = randn(n,T,d);
Y = randn(n,T);

cfg.xlags = 3;
cfg.ylags = 2;
cfg.lambda = 1;

w = larx_fit(data,Y,cfg)

%% truncate gauss test

n = 10; 
T = 100;
d = 5;

data = randn(n,T,d)*0.1;
sigma = 10;
ctr = 90;

Y = zeros(n,T);
to = ctr - sigma;
Y(:,to:end) = 1;

for j=1:n
    Y(j,:) = Y(j,:)*(j>5);
    for i=1:d        
        data(j,:,i) = data(j,:,i) + i/d*my_sig(sigma,ctr,T)*(j>5);        
    end
end


cfg.xlags = 5;
cfg.ylags = 2;
cfg.lambda = 1;
w = larx_fit(data,Y,cfg);

%% plot results
j = 1;
X = squeeze(data(j,:,:))';
%X = randn(size(X))*0.1;
yh = larx_predict(w,X,0,cfg);
t = 1:T;
clf reset
plot(t,X(5,:),t,yh)
hold on
plot(t,Y(j,:),'g')
plot(t,0.5*ones(1,T),'k--')
hold off
legend('data','model','target','p=0.5','Location','NorthWest')


















