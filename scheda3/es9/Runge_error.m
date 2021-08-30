function [err,I2] = Runge_error(a,b,n_nodes,F)
%RUNGE_ERROR 
arguments
    a,b
    n_nodes {mustBeOdd, mustBeNonzero}
    F
end

X = linspace(a,b,n_nodes);
I2 = composite_Newton_Cotes(X,2,F,false);

X = X(1:2:length(X));
I1 = composite_Newton_Cotes(X,2,F,false);

% (formula (82))
err = abs(I2 - I1)/3;

end

