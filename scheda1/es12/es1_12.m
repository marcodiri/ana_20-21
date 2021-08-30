clear
% Bernstein approximant always interpolates the first and last knot.
% Also the error for small n can be very big, and the speed of
% convergence is extremely low.

f = @(x) 1./(1+25*x.^2);
interval = [-1,1];
n = 10;
nodes = [interval(1):(interval(2)-interval(1))/n:interval(2)]; % uniform nodes
f_nodes = f(nodes);

x_ax = linspace(interval(1),interval(2),1000);
P = bernstein_approximant(f_nodes,n,interval,x_ax);

figure
hold on
plot(x_ax,P,'DisplayName','Bernstein approx');
f_x = f(x_ax);
plot(x_ax,f_x,'DisplayName','original function')
scatter(nodes,f_nodes,'filled','DisplayName','points')
% plot error
error = f_x-P;
plot(x_ax,error,'m--','DisplayName','error')
hline(0)
hold off
title(sprintf('Bernstein approximant with %d nodes',n))
legend