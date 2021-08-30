clear

a=0; b=4*pi;
% function in the exercise text was wrong
F = @(x) (sin(6*x)+1).*(x < 2*pi) + (1+(exp(x)-exp(2*pi))/100000).*(x >= 2*pi);
% F = @(x) (exp(-x)+cos(x)).*(x < 2*pi) + (x+1-2*pi).*(x >= 2*pi);
x_ax = linspace(a,b,1000);
plot(x_ax,F(x_ax),'DisplayName',replace(char(F),{'@(x)','.'},''));
legend

figure
tol = .01;
I = adaptive_quadrature_rule(a,b,F,tol);
y = ylim;
if y(1) ~= 0
    ylim([y(1)-1,y(2)]);
end