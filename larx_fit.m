function w = larx_fit(data, Y, cfg)
%data: trials x samples x channels
%Y: trials x samples

[n,T,d] = size(data);
xlags = cfg.xlags;
ylags = cfg.ylags;
lambda = cfg.lambda;

opts.useMex = 1;
opts.Method = 'lfbgs';
opts.numDiff = 1;
opts.Display = 'off';

wnum = d*xlags+ylags+1;
wo = randn(wnum,1); %rand init?
w = minFunc(@obj_func, wo, opts);

    function [J,dJ] = obj_func(w)
        
        Yh = Y;
        nn = size(Y,1);
        
        for i=1:nn
            X = squeeze(data(i,:,:))';
            Yh(i,:) = larx_predict(w,X,0,cfg);        
        end
        
        epi = 0.001;
        Yh(Yh < epi) = epi; %avoid 0 probabilities
        
        %J = sum(sum((Y - Yh).^2)) + lambda*(w'*w); %Squared Loss + L2 penalty 
        %J = sum(sum((Y - Yh).^2)) + lambda*sum(abs(w)); %Squared Loss + L1 penalty    
        J = -1*sum(sum( Y.*log(Yh) + (1-Y).*log(1-Yh) )) + lambda*(w'*w); % - Log Likelihood + L2 penalty               
                
    end  

end
