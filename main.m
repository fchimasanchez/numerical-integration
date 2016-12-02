## Copyright (C) 2016 Francisco Chima Sanchez
##
## Author: Francisco Chima Sanchez
## Created: 2016-09-27
## Last Modified: 2016-09-27

% main.m is the parent function for an implementation of a vectorized version
% of the Composite Trapezoidal Rule used to approximate the definite integral
% of any C^2 real-valued function over a predefined closed interval $[a,b]$.
%
% This function sets up and calls several auxiliary functions with the express
% purpose of accomplishing an arbitrarily accurate approximation to the
% desired integral. Here, I use CTR to approximate definite integrals of
% $f(x)=e^{-x^2}$, which can only be expressed analytically in terms of
% the error function erf.

function  main ()

% Initialize important values
eps = 1.0e-5;
a = 0;
b = 1;
exact = 0.74682413;

% Train composite trapezoidal rule
H = train_ctr(a, b, exact, eps);
X = a:H:b;
Th = composite_trapezoidal_rule(X);

% Print results

fprintf(['Tolerance value:\n\t%e\n'],eps);
fprintf(['Requisite step size for approximating the integral:\n\t%e\n'],
        H);
fprintf(['Exact value:\n\t%f\n'],exact);
fprintf(['Approximate value:\n\t%f\n'],Th);

endfunction
