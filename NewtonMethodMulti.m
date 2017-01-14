% F is cell array of anonymous functions which are to be zeroed
% Number of elements in F is same as number of variables in each f
% xi is initial guess column vector with length equal to F's len.
function [x, n, e] = NewtonMethodMulti(F, xi, err, nMax)
    n = 0;
    e = Inf;
    x = 0;
    l = length(F);
    
    f = zeros(l,1);
    J = zeros(l,l);
    
    while n<nMax && e>err
        
        x0 = num2cell(xi);
        parfor i=1:l
            Fi = F{i};
            f(i)=Fi(x0{:});
            for j=1:l
                J(i,j)=Partial(Fi,x0,j);
            end
        end
        
        x = xi - (pinv(J)*f);
        
        e = max(abs((x-xi)));
        
        xi = x;
        n = n + 1;
    end
end
function y = Partial(f, x, i)
    epsilon = 1e-10;
    z = x;
    z{i}=z{i}+epsilon;
    y = (f(z{:})-f(x{:}))/epsilon;
end