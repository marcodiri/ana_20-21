function [C] = least_square_poly_approx(degree,X,F)
%LEAST_SQUARE_APPROX 

A=flip(vander(X),2); A=A(:,1:degree+1); % Vandermonde matrix
[C,~]=least_square_problem_QR(A,F); % solve system by QR-factorization

end

