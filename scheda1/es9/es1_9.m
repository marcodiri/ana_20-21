nodes = [1 2 3];
x_ax = linspace(min(nodes),max(nodes),1000);

[U,V] = hermite_bases(nodes,x_ax);

for j=1:length(nodes)
    figure
    hold on
    uj = U(j,:);
    plot(x_ax,uj,'DisplayName',sprintf('u%d',j));
    vj = V(j,:);
    plot(x_ax,vj,'DisplayName',sprintf('v%d',j));
    scatter(nodes,zeros(1,length(nodes)),'filled',...
        'DisplayName','interp knots')
    % plot V directions at nodes
    for k=1:length(nodes)
        % tangent of Vj in xk is 1 iff j==k, else 0
        % draw it in points around the node
        if k ~= j
            m = 0;
            pnts = [nodes(k)-.2:.01:nodes(k)+.2];
        else
            m = 1;
            pnts = [nodes(k)-.1:.01:nodes(k)+.1];
        end
        tgt = @(x) m*x - m*nodes(k); % tangent equation
        plot(pnts,tgt(pnts),'b-.','LineWidth',1.5,...
            'HandleVisibility','off','DisplayName','')
    end
    plot(NaN,NaN,'b-.','DisplayName','direction'); % add custom entry to legend
    hline(0)
    hold off
    legend
end