clear

a=-5; b=5;
m_intervals = 10; % number of intervals [a,b] will be split into
nodes_per_interval = 2; % 2 composite trapezoidal
                        % 3 composite Simpson-Cavalieri

x_ax = linspace(a,b,1000);

X = linspace(a,b,m_intervals+1);
F = @(x) x.*sin(x);

figure
I = composite_Newton_Cotes(X,nodes_per_interval,F);
xticks(X)
title(sprintf("%d intervals, %d nodes per interval",m_intervals,nodes_per_interval))
legend(replace(char(F),{'@(x)','.'},''),'approx')

% calculate dop
mistake = false;
dop = -1;
while ~mistake
    F = @(x) x.^(dop+1);
    I = composite_Newton_Cotes(X,nodes_per_interval,F,false);
    I_true = (b^(dop+2)-a^(dop+2))/(dop+2);

    if abs(I - I_true) < 10^(-8) % check approx integral
        dop = dop + 1;
    else
        mistake = true;
    end
end
fprintf("formula for %d nodes per interval, dop = %d\n",nodes_per_interval,dop);