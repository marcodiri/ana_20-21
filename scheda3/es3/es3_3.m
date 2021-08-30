clear

for n=2:2:10
    X = [0:n];
    W = quadrature_weights_Lagrange(X);
    figure
    scatter(X,W);
    title(sprintf('n=%d',n))
end