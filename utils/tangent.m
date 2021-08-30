function [tangent] = tangent(func,point)
%TANGENT compute the tangent of func in point
%   func: symbolic function
%   point: vector with x and y coordinates 
%       at which to calculate the tangent

% compute tangent equation: tangent(x) = V'(xk)x + V(xk)-V'(xk)xk
syms x
direction(x) = diff(func);
direction = direction(point(1)); % V'(xk)
tangent(x) = direction*x;
q = point(2)-tangent(point(1)); % V(xk)-V'(xk)xk
tangent(x) = tangent + q; % V'(xk)x + V(xk)-V'(xk)xk
end

