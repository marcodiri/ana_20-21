clear

a = -2;
b = 2;
n_nodes = 5;
nodes = linspace(a,b,n_nodes);
x_ax = linspace(a,b,1000);
basis = 3;
f = lagrange_basis(nodes, basis, x_ax, true);
title(sprintf('Lagrange basis j=%d',basis));
hline(0);