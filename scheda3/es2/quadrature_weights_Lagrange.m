function [W] = quadrature_weights_Lagrange(X)
%quadrature_weights_Lagrange 

arguments
    X {mustBeVector}
end

n = length(X);
x_ax=linspace(min(X),max(X),1000);
for i=1:n
    li = lagrange_basis(X,i,x_ax);
    W(i) = trapz(li); % integrate li
end

end

