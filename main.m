## Author: Francisco Chima Sanchez
## Created: 2016-09-27
## Last Modified: 2017-04-05

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
eps = 1.0e-5; % Tolerance for error
a = 0; % Lower limit for integral
b = 1; % Upper limit for integral
exact = 0.74682413; % Erf(1), precise to 8 significant figures

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

% composite_trapezoidal_rule.m implements a vectorized Composite Trapezoidal 
% Rule numerical quadrature algorithm given a specified vector X of equidistant
% nodes in the domain of function $f\colon\R\to\R$, whose function values
% are calculated using vector X. The function outputs a scalar value
% representing the approximate quadrature of $f$ over X.

function ctr = composite_trapezoidal_rule (X)

% Initialization of important values/vectors
n = size(X); % number of equidistant nodes
h = (X(n)-X(1))/n; % step size for given vector X

% Calculate function values $f(x)$ given integrand $f$
F = integrand(X);

% Rescale function values on endpoints
F(1) = 0.5.*F(1);
F(n) = 0.5.*F(n);

% Vectorized Composite Trapezoidal Rule
ctr = h.*sum(F);

endfunction

% ctr_error.m computes the approximation error between the output of CTR
% and the actual analytical value of the integral. Here, I use the basic
% 1-norm on $\R$, $\|a-b\|=|a-b|$, to determine the error.

function err = ctr_error (approx, exact)

% 1-norm as a metric on $\R$ to calculate error of approximation
err = abs(approx-exact);

endfunction

% train_ctr.m calls composite_trapezoidal_rule repeatedly in an effort to
% reduce the approximation error to below a specified threshold eps.
% This is accomplished by more and more finely partitioning $[a,b]$ and
% calculating the approximation error in every iteration.
%
% This function returns the step size H that satisfies the tolerance 
% requirement. It also plots the error as a function of number of nodes.

function H = train_ctr (a, b, exact, eps)

% Initialize important values
length = b - a; % Length of interval
h = length./10; % Step size
X = a:h:b; % Vector holding partition values
hVec = h; % Initializes vector of step sizes
E = 0; % Set error to zero

% Trains CTR to reduce the step size until the error is less than some accepted tolerance
approx = composite_trapezoidal_rule(X);
err = ctr_error(approx,exact);

while err > eps,
   h = 0.5*h; % Reduce step size in half
   hVec = [hVec; h]; 
   X = a:h:b; % Reset partition of interval
   approx = composite_trapezoidal_rule(X);
   err = ctr_error(approx,exact);
   E = [E; err];
end;

fprintf("Step size   Error\n");
P = [hVec E];
disp(P)
H = h;

endfunction

% integrand.m returns function values of a specified integrand $f\colon\R\to\R$
% given a vector of domain values X. If X is a vector of size n, then F is
% also a vector of size n.

function F = integrand (X)

% Vectorized implementation of value passing from X to the error function
% integrand $e^{-x^2}\colon\R\to\left\{x\geq 0\right\}$
F = exp(-X.^2);

endfunction

