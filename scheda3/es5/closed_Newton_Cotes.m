function [I] = closed_Newton_Cotes(a,b,n_nodes,F,plot_it)
%CLOSED_NEWTON_COTES 
arguments
    a,b,n_nodes,F
    plot_it = true
end

x_ax = linspace(a,b,1000);
X = linspace(a,b,n_nodes);
f = F(X);
switch length(X)
    case 2
        h = b-a;
        I = (f(1)+f(2))*h/2;
    case 3
        h = (b-a)/2;
        I = (f(1)+4*f(2)+f(3))*h/3;
    case 4
        h = (b-a)/3;
        I = (f(1)+3*f(2)+3*f(3)+f(4))*3*h/8;
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

