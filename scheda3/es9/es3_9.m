clear

a=-5; b=5;
n_nodes = 9;

x_ax = linspace(a,b,1000);

F = @(x) x.*sin(x);

[err,~] = Runge_error(a,b,n_nodes,F)