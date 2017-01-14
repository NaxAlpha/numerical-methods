function [x, n, e] = NewtonMethod(f, df, xi, err, nMax)
    n = 0;
    e = Inf;
    x = 0;
    
    while n<nMax && e>err
        x = xi - f(xi)/df(xi);
        
        e = abs((x-xi)/x);
        
        xi = x;
        n = n + 1;
    end
end