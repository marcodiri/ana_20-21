clear

a=0; b=2*pi-.001; % IMPORTANT: 2pi must not be included!
n = 6;
x = [a:2*pi/(n+1):b]; % n+1 uniform nodes
                      % IMPORTANT: nodes xj must be spaced by j*2pi/(n+1)
                      % so b is NEVER included

if input('choose 0: x^2, 1: sin^2(x) >> ') == 0
	f = @(x) x.^2;
else
    f = @(x) sin(x).^2;
end
F = f(x);

[x_ax,I]=uniform_trigonometric_interpolation(x,F);
figure
hold on
scatter(x,F,'DisplayName','points')
plot(x_ax,f(x_ax),'DisplayName',replace(char(f),{'@(x)','.'},''))
plot(x_ax,I,'DisplayName','interp')
hold off
legend('Location','northwest')
