## Copyright (C) 2016 Francisco Chima Sanchez
## 
## Author: Francisco Chima Sanchez
## Created: 2016-09-27
## Last Modified: 2016-09-27

% train_ctr.m calls composite_trapezoidal_rule repeatedly in an effort to
% reduce the approximation error to below a specified threshold eps.
% This is accomplished by more and more finely partitioning $[a,b]$ and
% calculating the approximation error in every iteration.
%
% This function returns the step size H that satisfies the tolerance 
% requirement. It also plots the error as a function of number of nodes.

function H = train_ctr (a, b, exact, eps)

% Initialize important values
length = b - a;
h = length./10;
X = a:h:b;
hVec = h;
E = 0;

approx = composite_trapezoidal_rule(X);
err = ctr_error(approx,exact);
while err > eps,
   h = 0.5*h;
   hVec = [hVec; h];
   X = a:h:b;
   approx = composite_trapezoidal_rule(X);
   err = ctr_error(approx,exact);
   E = [E; err];
end;
fprintf("Step size   Error\n");
P = [hVec E];
disp(P)
H = h;

endfunction
