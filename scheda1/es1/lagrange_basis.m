function [lj] = lagrange_basis(nodes,j,x_ax,make_plot)
%LAGRANGE_BASIS return Lagrange basis of order j

arguments
    nodes {mustBeVector,mustBeUnique}
    j {mustBeInteger}
    x_ax = linspace(min(nodes),max(nodes),1000) % default x axis
    make_plot logical = false
end

lj = ones(1, length(x_ax));
for i=1:length(nodes)  % basis product of sequence
    if j~=i
        lj = lj .* (x_ax - nodes(i))/(nodes(j)-nodes(i));
    end
end

if make_plot
    hold on
    plot(x_ax,lj)
    scatter(nodes,zeros(1,length(nodes)),'filled')
end

end
