function [x, n, e] = FalsePosition(f, a, b, err, nMax)
    n = 0;
    e = Inf;
    fa = f(a);
    fb = f(b);
    c0 = 0;
    while n<nMax && e>err
        c1 = b - fb*(a-b)/(fa-fb);
        e = abs((c1-c0)/c1);
        fc = f(c1);
        test = fc*fa;
        if test<0
            b = c1;
            fb = fc;
        elseif test>0
            a = c1;
            fa = fc;
        else
            e = 0;
        end
        c0 = c1;
        n = n + 1;
    end
    x = c0;
end