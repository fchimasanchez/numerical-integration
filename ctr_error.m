## Copyright (C) 2016 Francisco Chima Sanchez
## 
## Author: Francisco Chima Sanchez
## Created: 2016-09-27
## Last Modified: 2016-09-27

% ctr_error.m computes the approximation error between the output of CTR
% and the actual analytical value of the integral. Here, we use the basic
% 1-norm on $\R$, $\|a-b\|=|a-b|$, to determine the error.

function err = ctr_error (approx, exact)

% 1-norm as a metric on $\R$ to calculate error of approximation
err = abs(approx-exact);


endfunction
