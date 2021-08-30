nodes = [1 2 3];
x_ax = linspace(min(nodes),max(nodes),1000);

[U,V] = hermite_bases(nodes,x_ax);
for j=1:length(nodes)
    figure
    hold on
    plot(x_ax,U(j,:),'DisplayName',sprintf('u%d',j));
    plot(x_ax,V(j,:),'DisplayName',sprintf('v%d',j));
    hline(0)
    hold off
    legend
end