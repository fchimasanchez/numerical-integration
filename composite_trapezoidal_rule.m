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
