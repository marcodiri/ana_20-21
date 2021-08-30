clear

a = -3;
b = 2;
nodes = linspace(a,b,5);
figure
hold on
x_ax = linspace(a,b,1000);   % x axix
for i = 1:length(nodes)
    l(i,:) = lagrange_basis(nodes,i,x_ax,true);
end
scatter(nodes,zeros(1,length(nodes)),'filled')
sum = plot(x_ax,sum(l),'--r','DisplayName','sum');    % plot bases sum
legend(sum)
hline(0);
hold off