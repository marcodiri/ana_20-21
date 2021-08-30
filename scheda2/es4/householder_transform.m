function [y] = householder_transform(u,x)
%HOUSEHOLDER_TRANSFORM
%   es: householder_transform([1; 2; 3], [4; 5; 6])

arguments
    u {mustBeVector}
    x {mustBeVector}
end

if size(u) ~= size(x)
    throw(MException('MATLAB:invalidInput',"vectors have different size"));
end

H = hauseholder_matrix(u);
y = H*x;

end

