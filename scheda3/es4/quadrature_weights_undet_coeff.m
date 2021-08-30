function [W] = quadrature_weights_undet_coeff(X)
%QUADRATURE_WEIGHTS_UNDET_COEFF 

A = flip(vander(X)');
a = min(X);
b = max(X);
for n=0:length(X)-1
    B(n+1) = (b^(n+1)-a^(n+1))/(n+1);
end

W = A\B';

end

