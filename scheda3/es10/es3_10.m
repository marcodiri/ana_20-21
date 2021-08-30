clear

switch input('1, 2, 3 >> ')
    case 1
        a=0; b=2*pi;
        F = @(x) sin(x);
        I = -cos(b) + cos(a);
    case 2
        a=-4; b=4;
        F = @(x) exp(x);
        I = exp(b) - exp(a);
    case 3
        a=-5; b=5;
        F = @(x) 1./(1+x.^2);
        I = atan(b) - atan(a);
end
x_ax = linspace(a,b,1000);

for n=2:2:10
    [err,~] = Runge_error(a,b,n+1,F);
    err = round(err,12);
    err_real = round(...
        abs(I - composite_Newton_Cotes(linspace(a,b,n+1),2,F,false))...
        ,12);
    fprintf("%s, %d nodes, "+...
    "Grunge error = %.2f, Real error = %.2f\n",...
    replace(char(F),{'@(x)','.'},''),n+1,err,err_real);
end
