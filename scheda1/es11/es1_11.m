clear

a=0; b=1;
n = 3;

x_ax = linspace(a,b,1000);

B = bernstein_basis(n,[a,b],x_ax);
for i=1:n+1
    Bi = B(i,:);
    figure
    plot(x_ax,Bi);
end