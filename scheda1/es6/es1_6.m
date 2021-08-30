clear

a=0;
b=5;
for n=4:2:12
    nodes=linspace(a,b,n);
    figure
    hold on
    monic_polynomial(nodes);
    scatter(nodes,zeros(1,length(nodes)),'DisplayName','nodes')
    hline(0)
    hold off
    title(sprintf('Monic polynomial w for %d uniform nodes',n))
    legend;
end
