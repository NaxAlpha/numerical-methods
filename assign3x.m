%% Numerical Methods
% *Assignment 3*
% 
% In this assignment, We will compare following properties of each method
%
% # Accuracy
% # Number of Iterations
% # Average CPU Cost per iteration
%
%% Question 1
% In this question, we will compare three different methods for finding
% roots of equation:
% 
% # False-Position Method
% # Secant Method
% # Newton's Method

% Lets Define Function
f = @(x) 230*x^4 + 18*x^3 + 9*x^2 - 221*x - 9; % Similar to Inline but symbolically
% Lets Define Derivative
df = @(x)  920*x^3 + 54*x^2 + 18*x - 221;
% Output Format
sFormat = '\tRoot: %g in %d Iterations\n\tWith Error %g and Time %gms per Iteration\n';

%%
% *False Position Method*
%
% Following is Algorithm of False Position Method
% 
% <include>FalsePosition.m</include>
%

disp('=====================');
disp('False Position Method');
disp('=====================');
% Solution 1 of Function
disp('Solution of Function in Interval [-1, 0]:')
t = cputime;
[x, n, e] = FalsePosition(f, -1, 0, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);
% Solution 2 of Function
disp('Solution of Function in Interval [0, 1]:')
t = cputime;
[x, n, e] = FalsePosition(f, 0, 1, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);

%% 
% *Secant Method*
%
% Following is Algorithm for Secant Method
%
% <include>SecantMethod.m</include>
%

disp('=====================');
disp('====Secant Method====');
disp('=====================');
% Solution 1 of Function
disp('Solution of Function For Interval [-1, 0]:')
t = cputime;
[x, n, e] = SecantMethod(f, -1, 0, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);
% Solution 2 of Function
disp('Solution of Function For Interval [0, 1]:')
t = cputime;
[x, n, e] = SecantMethod(f, 0, 1, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);
% Since for interval [0,1] we got same solution so we change our interval
disp('Solution of Function For Interval [1, 2]:')
t = cputime;
[x, n, e] = SecantMethod(f, 0, 1, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);

%%
% *Newton's Method*
%
% Following is Algorithm for Newton's Method
%
% <include>NewtonMethod.m</include>
%

disp('=====================');
disp('====Newton Method====');
disp('=====================');
% Solution 1 of Function
disp('Solution of Function For Initial Value -0.5:')
t = cputime;
[x, n, e] = NewtonMethod(f, df, -0.5, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);
% Solution 2 of Function
disp('Solution of Function For Initial Value 0.5:')
t = cputime;
[x, n, e] = NewtonMethod(f, df, 0.5, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);
% Since for initial guess 0.5 we got same solution so we change our guess
disp('Solution of Function For Initial guess:')
t = cputime;
[x, n, e] = NewtonMethod(f, df, 1.5, 10^-6, Inf);
t = cputime - t;
fprintf(sFormat,x,n,e,t*1000/n);
%%
% Thus we can compare results as following
% 
% * CPU time per iteration is too small to be measured
% * _False Position Method_ provides reasonable result within interval as
% compared to other methods which don't remain in interval
% * Although _Secant Method_ for first solution converges quicker then
% _Newton's Method_ but in general *Newton's Method* is more robust and has
% high convergance rate as compared to _Secant Method_

%% Question 2
% In this question we will compare two methods specifically simpson's
% methods for finding integral of function on given interval:
%
% # Simpson's 1/3 Rule
% # Simpson's 3/8 Rule
%

% Let's Deffine Function of Integration
f = @(x)sin(x).^2-2*x.*sin(x)+1;

%%
% *Simpson's 1/3 Rule*
%
% Following is Optimized Algorithm for Simpson's 1/3 Rule:
%
% <include>Simpson13.m</include>
%

% Since n is 12 but in Simpson's 1/3 Rule we only have n/2 sub intervals so
int1 = Simpson13(f,6,0.75,1.75);
fprintf('Simpson 1/3 Result: %g\n',int1);

%%
% *Simpson's 3/8 Rule*
%
% <include>Simpson38.m</include>
%

% Since n is 12 but in Simpson's 3/8 Rule we only have n/3 sub intervals so
int2 = Simpson38(f,6,0.75,1.75);
fprintf('Simpson 3/8 Result: %g\n',int2);

%%
% Following Comparision shows there is a little difference between result
% of _Simpson's 1/3 Rule_ and _Simpson 3/8 Rule_. 
disp(int2-int1)
%%
% * Error of both rules is of order of 4
% * Only difference in error is factor 8/27
% * Thus *Simpson's 1/3 Rule* error is 8/27 times the error of 3/8 Rule
% * From Code Point of view, Simpson's 3/8 Rule is better for serial code
% execution whereas Simpson's 3/8 is useful when parallel execution is
% required to accelerate computations

%% Question 3
% In this question, we will solve three equations each function of three
% variable to achieve accuracy of 10^-6 using newton's method for solution
% of multiple equations
%
% <include>NewtonMethodMulti.m</include>
%

% Lets Define Equations
F = {@(x1,x2,x3)6*x1-2*cos(x2*x3)-1,
    @(x1,x2,x3)9*x2+sqrt(x1^2+sin(x3)+1.06)+0.9,
    @(x1,x2,x3)60*x3+3*exp(-x1*x2)+10*pi-3};
xi = [1;2;3]; % MUST be A COLUMN VECTOR
[x,n,e]=NewtonMethodMulti(F,xi,1e-10,Inf);
fprintf('Got Solution with \n\tx1=%g\tx2=%g\tx3=%g\n\tWithin %d Iterations with accuracy of %g\n',x(1),x(2),x(3),n,e);

%% Disclaimer
% This Assignment contains implementation of few _Numerical Methods_ which
% are highly optimized and vectorized to provide maximum performance
% without loss of accuracy. These methods are not copied from internet
% source but made by myself to test my knowledge of matlab.