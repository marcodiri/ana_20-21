function [x,y] = least_square_problem(A,b)
%LEAST_SQUARE_PROBLEM
%   es: [x,y] = least_square_problem([1,2; 3,4], [5; 6])

arguments
    A {mustBeSquare}
    b
end

% check if A has max rank and b coherent
if rank(A) ~= size(A,1) || size(b,1) ~= size(A,1)
    throw(MException('MATLAB:invalidInput'));
end

% the problem At*A*x=At*b has a unique solution
x = (A'*A)\(A'*b);
y = round(norm(A*x-b),9);

end