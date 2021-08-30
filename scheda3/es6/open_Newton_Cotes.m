function [I] = open_Newton_Cotes(a,b,n_nodes,F,plot_it)
%open_Newton_Cotes
arguments
    a,b,n_nodes,F
    plot_it = true
end

x_ax = linspace(a,b,1000);
if n_nodes == 1
    X = (a+b)/2;
else
    X = linspace(a,b,n_nodes);
end
f = F(X);
switch length(f)
    case 1
        h = (b-a)/2;
        I = f(1)*2*h;
    case 2
        h = (b-a)/3;
        I = (f(1)+f(2))*3*h/2;
end

if plot_it
    hold on
    area(x_ax,F(x_ax),'FaceAlpha',.5,'FaceColor','r',...
        'EdgeColor','none','LineStyle','--','LineWidth',1);
    area(x_ax,lagrange_interpolant(X,f,x_ax),...
        'FaceAlpha',.5,'FaceColor','b','EdgeColor','black',...
        'LineStyle','--','LineWidth',1);
    hold off
end

end

