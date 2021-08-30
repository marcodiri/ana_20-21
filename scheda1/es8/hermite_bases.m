function [U,V] = hermite_bases(nodes,x_ax)
% no symbolic

arguments
    nodes
    x_ax = linspace(min(nodes),max(nodes),1000) % defaults to x axis
end

for j=1:length(nodes)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % lagrange basis derivative calculated in nodes(j)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    den = 1;
    num = 0;
    for i=1:length(nodes)
        %denominator
        if i~=j
            den = den * (nodes(j)-nodes(i));
        end
        % numerator
        if i~=j
            num_i = 1;
            for k=1:length(nodes)
                if k~=i && k~=j
                    num_i = num_i * (nodes(j)-nodes(k));
                end
            end
            num = num + num_i;
        end
    end
    lj_der = 1/den * num;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % lagrange basis calculated on points in x (vector)
    basis = lagrange_basis(nodes,j,x_ax,false);
    % matrices: each row is a uj (vj) calculated on x
    U(j,1:length(x_ax)) = (1-2*lj_der*(x_ax-nodes(j))).*basis.^2;
    V(j,1:length(x_ax)) = (x_ax-nodes(j)).*basis.^2;
end
end