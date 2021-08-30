clear

a=0;
b=5;
for n=4:2:12
    for ind=1:n
        xi=cos((2*ind)/(n+1)*pi/2);
        nodes(ind)=(a+b)/2+(b-a)*xi/2;
    end
    figure
    hold on
    monic_polynomial(nodes);
    scatter(nodes,zeros(1,length(nodes)),'DisplayName','nodes')
    hline(0);
    hold off
    title(sprintf('Monic polynomial w for %d Chebyshev nodes',n))
    legend;
end
