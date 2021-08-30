clear

nodes = [1,2,5,8,9];

% anonymous function:
% https://it.mathworks.com/help/matlab/matlab_prog/anonymous-functions.html
f = @(x) 1./(x.^2); % choose a function to interpolate,
                    % like 1/x^2 that interpolates badly

x_ax = linspace(min(nodes),max(nodes),1000);  % x axis

figure
hold on
plot(x_ax,f(x_ax))  % plot real function
L = lagrange_interpolant(nodes,f(nodes),x_ax);  % build interpolant
plot(x_ax,L,nodes,f(nodes),'ob')  % plot interpolant
hold off
legend(replace(char(f),{'@(x)','.'},''),'Lagrange','nodes')