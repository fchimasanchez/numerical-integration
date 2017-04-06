## Copyright (C) 2016 Francisco Chima Sanchez
## 
## Author: Francisco Chima Sanchez
## Created: 2016-09-27
## Last Modified: 2016-09-27

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

% integrand.m returns function values of a specified integrand $f\colon\R\to\R$
% given a vector of domain values X. If X is a vector of size n, then F is
% also a vector of size n.

function F = integrand (X)

% Vectorized implementation of value passing from X to the error function
% integrand $e^{-x^2}\colon\R\to\left\{x\geq 0\right\}$
F = exp(-X.^2);

endfunction
