function int = Simpson38(f, nSubInt, a, b)
    n = nSubInt * 3;
    h = (b-a)/n;
    x = a:h:b;
    fx = f(x);
    int = fx(1)+fx(n+1);
    int = int + 3*sum(fx(2:3:(n-1)))+3*sum(fx(3:3:n))+2*sum(fx(4:3:(n-2)));
    int = int * (3*h/8);
end