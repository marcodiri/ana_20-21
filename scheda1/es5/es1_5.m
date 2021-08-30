clear

a = -5;
b = 5;

% first function
f = @(x) 1./(1+x.^2);
plot_f(f,[a,b]);

if input('proceed to next f? (1/0): ') == 0
    return
end

% second function
f = @(x) sin(2*pi*x);
plot_f(f,[a,b]);


function nodes = get_nodes(range,n)
    % chebyshev distribution
    a = range(1);
    b = range(2);
    for ind=1:n
        xi=cos((2*ind)/(n+1)*pi/2);
        nodes(ind)=(a+b)/2+(b-a)*xi/2;
    end
end
    
function plot_f(f, interval)
    a = interval(1);
    b = interval(2);
    x_ax = linspace(a,b,1000);
    f_x = f(x_ax);
    for n=10:5:20  % nodes number
        nodes = get_nodes([a,b],n);
        f_nodes = f(nodes);
        
        figure
        hold on
        
        plot(x_ax,f_x,'DisplayName',replace(char(f),{'@(x)','.'},''))
        
        L = lagrange_interpolant(nodes,f_nodes,x_ax);
        plot(x_ax,L,'DisplayName','interpolant')  % plot interpolant
        scatter(nodes,f_nodes,'DisplayName','points')
        
        % plot error
        error = L-f_x;
        plot(x_ax,error,'--','Color','m','DisplayName','error');
        hline(0);
        legend
        title(sprintf('f=%s - %d nodes - Chebyshev',replace(char(f),{'@(x)','.'},''),n));
        hold off
    end
end