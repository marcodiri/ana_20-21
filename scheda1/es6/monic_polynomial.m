function [w] = monic_polynomial(nodes,x_ax)

arguments
    nodes {mustBeVector,mustBeUnique}
    x_ax = linspace(min(nodes),max(nodes),1000);
end

w = 1;
for i=1:length(nodes)
    w = w.*(x_ax-nodes(i));
end
plot(x_ax, w,'DisplayName',sprintf('w_{%d}',length(nodes)));
end