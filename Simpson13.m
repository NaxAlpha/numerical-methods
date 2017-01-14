function int = Simpson13(f, nSubInt, a, b)
    n = nSubInt * 2;
    h = (b-a)/n;
    x = a:h:b;
    fx = f(x);
    int = fx(1)+fx(n+1);
    int = int+4*sum(fx(2:2:(n)))+2*sum(fx(3:2:(n-1)));
    int = int * (b-a)/(3*n);
end