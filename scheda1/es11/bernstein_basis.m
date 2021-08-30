function [B] = bernstein_basis(n,interval,x_ax)
%BERNSTEIN_BASIS returns a vector of n+1 Bernstein basis in [a,b]
%   n: number of basis
%   interval: vector such that [interval(1),interval(2)]=[a,b]

a = interval(1);
b = interval(2);

for i=0:n
    B(i+1,:) = nchoosek(n,i)*((a-x_ax).^i.*(x_ax-b).^(n-i))./(a-b)^n;
end
end

