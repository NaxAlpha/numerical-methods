%% Numerical Methods
% *Assignment 3*
%% Question 1
% In this question, we will compare three different methods for finding
% roots of equation:
% 
% # False-Position Method
% # Secant Method
% # Newton's Method
% 
% We will compare following properties of each method
%
% # Accuracy
% # Number of Iterations
% # Average CPU Cost per iteration
%

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