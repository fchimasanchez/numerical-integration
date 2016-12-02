## Copyright (C) 2016 Francisco Chima Sanchez
## 
## Author: Francisco Chima Sanchez
## Created: 2016-09-27
## Last Modified: 2016-09-27

% integrand.m returns function values of a specified integrand $f\colon\R\to\R$
% given a vector of domain values X. If X is a vector of size n, then F is
% also a vector of size n.

function F = integrand (X)

% Vectorized implementation of value passing from X to the error function
% integrand $e^{-x^2}\colon\R\to\left\{x\geq 0\right\}$
F = exp(-X.^2);

endfunction
