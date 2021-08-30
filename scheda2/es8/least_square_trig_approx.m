function [C] = least_square_trig_approx(degree,X,F)
%LEAST_SQUARE_TRIG_APPROX 

n_points = length(X);
if degree > n_points/2
    throw(MException('MATLAB:invalidInput',...
        "degree must be lower than or equal length(X)/2"));
end

A=ones(n_points,2*degree+1);
for i=1:2:2*degree
    A(:,i+1) = cos(i*X);
    A(:,i+2) = sin(i*X);
end
[C,~]=least_square_problem_QR(A,F); % solve system by QR-factorization

end

