function L = lagrange_interpolant(nodes,f_nodes,x_ax)

% if f_nodes is scalar assume f(node)=f_nodes for every node
if length(f_nodes) == 1
    f_nodes = repelem(f_nodes,length(nodes));
end

L = zeros(1,length(x_ax));  % polinomio di Lagrange
for j=1:length(nodes)  % sommatoria polinomio di Lagrange
    L = L + f_nodes(j) * lagrange_basis(nodes,j,x_ax,false);
end

end

