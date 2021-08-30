function [x,y] = least_square_problem_QR(A,b)
%LEAST_SQUARE_PROBLEM_QR
%   es: [x,y] = least_square_problem_QR([1,2; 3,4; 5,6], [7; 8; 9])

[m,n]=size(A);
if m < n
    throw(MException('MATLAB:invalidInput',...
        "size(A,1) must be greater than or equal size(A,2)"));
end

% check if A has max rank and b coherent
if rank(A) ~= min(m,n)
    throw(MException('MATLAB:invalidInput',"rank A not maximal"));
elseif size(b,1) ~= m
    throw(MException('MATLAB:invalidInput',...
        "size(b,1) must be coherent with size(A,1)"));
end

[Q,R]=QR_factorization(A);

% solve Qc=b and Rx=c to find x
c=Q'*b; % Q'==inv(Q) because Q orthogonal
U=R(1:n,1:n); % take only non-0 rows of R
c1=c(1:n); 
c2=c(n+1:m); % empty if m==n
x=U\c1; % same as R\c, but faster
% y = round(norm(A*x-b),9);
y=norm(c2);

end

