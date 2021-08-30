function [H] = hauseholder_matrix(u)

arguments
    u {mustBeVector}
end

% if u is zeros, alfa would be infinite
if u == zeros(length(u),1)
    throw(MException('MATLAB:invalidInput', ...
    'vector of zeros not accepted'));
elseif size(u,2) ~= 1
    throw(MException('MATLAB:invalidInput', ...
    'vector must be column'));
end

alfa = 2/sum(u.^2); % (u'*u) is the norm(u)^2;
H = eye(length(u))-alfa*(u*u');

end

