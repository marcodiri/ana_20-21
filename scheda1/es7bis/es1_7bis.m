clear

a=0;
b=5;
for n=4:4:12
    nodes_unif = linspace(a,b,n); % uniform
    for ind=1:n % Chebyshev
        xi=cos((2*ind)/(n+1)*pi/2);
        nodes_cheby(ind)=(a+b)/2+(b-a)*xi/2;
    end
    nodes_rand = sort(rand(1,n)*(b-a)+a);
    figure
    hold on
    monic_polynomial(nodes_unif);
    monic_polynomial(nodes_cheby);
    monic_polynomial(nodes_rand);
%     scatter(nodes_unif,zeros(1,length(nodes_unif)),'MarkerEdgeColor','#0072BD')
%     scatter(nodes_cheby,zeros(1,length(nodes_cheby)),'MarkerEdgeColor','#D95319')
%     scatter(nodes_rand,zeros(1,length(nodes_rand)),'MarkerEdgeColor','#EDB120')
    legend(sprintf('w_{%d} unif',length(nodes_unif)),...
        sprintf('w_{%d} Cheby',length(nodes_cheby)),...
        sprintf('w_{%d} rand',length(nodes_rand)))
    hline(0);
    hold off
    title(sprintf('Monic polynomial w for %d nodes',n))
    legend;
end
