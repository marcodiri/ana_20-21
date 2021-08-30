clear
rng(42)

m=3; n=50;
X = randn(n+1,1)*5;
f = @(x) x.^3;  % choose a function to generate points from
F = f(X);
% scatter the points just for fun
F = F+randi([0,floor(max(F)/100)],n+1,1).*sign(rand(n+1,1)*-2+1)*10;

C = least_square_poly_approx(m,X,F);

x_ax=linspace(min(X),max(X),1000);

figure
hold on
plot(x_ax,polyFromVec(C,x_ax),'DisplayName','approx')
% plot(x_ax,func(x_ax),'DisplayName','original')
scatter(X,F,'DisplayName','points')
hold off
legend('Location','northwest')

function P = polyFromVec(C,p)
% calculate polynomial with coefficients from C, on points in p
    P = 0;
    for i=1:length(C)
        P = P+C(i)*p.^(i-1);
    end
end