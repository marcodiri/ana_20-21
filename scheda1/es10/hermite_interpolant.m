function [P] = hermite_interpolant(interp_points,x_ax)
%HERMITE_INTERPOLATION returns the Hermite interpolant
%   interp_points: matrix with nodes as the first row,
%       f(nodes) as the second row,
%       f'(nodes) as the third row.

[U,V] = hermite_bases(interp_points(1,:),x_ax);
P = sum(interp_points(2,:)'.*U) + sum(interp_points(3,:)'.*V);
end

