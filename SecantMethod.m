function [x, n, e] = SecantMethod(f, a, b, err, nMax)
    n = 0;
    e = Inf;
    fa = f(a);
    fb = f(b);
    c0 = 0;
    while n<nMax && e>err
        c1 = b - fb*(a-b)/(fa-fb);
        e = abs(c1-c0);
        fc = f(c1);
        
        a = b;
        b = c1;
        fa = fb;
        fb = fc;
        
        c0 = c1;
        n = n + 1;
    end
    x = c0;
end