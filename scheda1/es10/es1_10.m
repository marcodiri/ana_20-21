clear
rng(2) % seed

n_nodes = 5;

% orginal function to interpolate
nodes = sort(randperm(10,n_nodes)); % randperm because we don't want repetitions
f = @(x) cos(x)+sin(2*x);
g = @(x) -sin(x)+2*cos(2*x);
args = [nodes;...       % first row: nodes;
        f(nodes);...    % second row: f(nodes);
        g(nodes)];      % third row: f'(nodes)              

nodes = args(1,:);
f_nodes = args(2,:);
g_nodes = args(3,:);

x_ax = linspace(min(nodes),max(nodes),1000);
plot(x_ax,f(x_ax),'DisplayName',sprintf(replace(char(f),{'@(x)','.'},'')));

P = hermite_interpolant(args,x_ax);

% plotting stuff
hold on
% plot interpolant
plot(x_ax,P,'DisplayName','Hermite interpolant');
scatter(nodes,f_nodes,'g','filled','DisplayName','interp points')
% plot directions
for k=1:length(nodes)
    tgt = @(x) g_nodes(k)*x + f_nodes(k) - g_nodes(k)*nodes(k);
    % draw it in points around the node
    pnts = [nodes(k)-.1:.01:nodes(k)+.1];
    plot(pnts,tgt(pnts),'r-.','LineWidth',1.5,...
        'HandleVisibility','off','DisplayName','')
end
plot(NaN,NaN,'r-.','DisplayName','directions'); % add custom entry to legend
hline(0)
hold off
legend('Location','southeast')