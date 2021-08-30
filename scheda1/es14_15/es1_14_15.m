clear

interval = [0,1];
n_nodes = 10;

% nodes to generate points to interpolate
nodes = [interval(1):1/n_nodes:interval(2)]; % con pochi punti l'interpolante va a farfalle
% nodes = sort(rand(1,n_nodes)); % FIXME

x_ax = [interval(1):.01:interval(2)];

if input('choose function: circle (0), Pascal snail (1): ') == 0
    figure
    hold on
    % circle
    xi=3*cos(2*pi*nodes);
    yi=3*sin(2*pi*nodes);
    plot(3*cos(2*pi*x_ax),3*sin(2*pi*x_ax),'DisplayName','true')
else
    figure
    hold on
    % Pascal snail
    b=1; a=2;
    r = b - a*sin(2*pi*nodes);
    xi = r.*cos(2*pi*nodes);
    yi = r.*sin(2*pi*nodes);

    r = 1 - 2*sin(2*pi*x_ax);
    plot(r.*cos(2*pi*x_ax),r.*sin(2*pi*x_ax),'DisplayName','true')
end

[Lx,Ly] = parametric_interpolant(interval,xi,yi,x_ax,"uniform");
plot(Lx,Ly,'DisplayName','interpolant')

scatter(xi,yi,'filled','DisplayName','interp points');
legend
