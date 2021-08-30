clear

% solve Ax=b
A=rand(3);
A=A'*A % make sure chol is applicable
b=[1;2;3]

disp("using inv");
% A square and not singular
x=A\b

disp("using chol");
% A simmetric and positive definite
R=chol(A);
y=R'\b;
x=R\y