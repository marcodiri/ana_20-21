function [P] = bernstein_approximant(f,n,interval,x_ax)
%BERNSTEIN_INTERPOLANT 

add = bernstein_basis(n,interval,x_ax);
P = sum(f'.*add);
end

