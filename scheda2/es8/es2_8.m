clear
rng(42)

m=5; n=10;
X = rand(n+1,1)*2*pi;
if input('choose 0: x^2+x-10, 1: cos(2x) >> ') == 0
    f = @(x) x.^2+x-10;
else
    f = @(x) cos(2.*x);
end
F = f(X);

C = least_square_trig_approx(m,X,F);

x_ax=linspace(min(X),max(X),1000);

figure
hold on
plot(x_ax,trigFromVec(C,x_ax),'DisplayName','approx')
plot(x_ax,f(x_ax),'DisplayName',replace(char(f),{'@(x)','.'},''))
scatter(X,F,'DisplayName','points')
hold off
legend('Location','northwest')

function T = trigFromVec(C,p)
% calculate trgionometric function with coefficients from C, on points in p
    T = C(1);
    for k=1:2:length(C)-1
        T=T+C(k+1)*cos(k*p)+C(k+2)*sin(k*p);
    end
end