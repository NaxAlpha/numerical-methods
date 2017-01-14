% RK Method of Order 2 for 3rd order Equation & Single Iteration
% Not very generic implementation of RK method
% f := f(t,y,p,q)
function [y1, p1, q1] = RK32(t0, y0, p0, q0, h, f)
    k1 = h * p0;
    l1 = h * q0;
    m1 = h * f(t0, y0, p0, q0);
    
    k2 = h * (p0 + 3*l1/2);
    l2 = h * (q0 + 3*m1/2);
    m2 = h * f(t0 + 3*h/2, y0 + 3*k1/2, p0 + 3*l1/2, q0 + 3*m1/2);
    
    y1 = y0 + (2*k1+k2)/3;
    p1 = p0 + (2*l1+l2)/3;
    q1 = q0 + (2*m1+m2)/3;
end