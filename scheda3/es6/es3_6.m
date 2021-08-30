clear

a = 1; b = 5;
n_nodes = 2;

F = @(x) sin(x)+cos(x);

I = open_Newton_Cotes(a,b,n_nodes,F);
title(sprintf('interpolating %s with %d nodes',...
    replace(char(F),{'@(x)','.'},''),n_nodes))
legend(replace(char(F),{'@(x)','.'},''),'approx')
fprintf("approximate integral %d\n",I);

% calculate dop
for n_nodes = 1:2    
    mistake = false;
    dop = -1;
    while ~mistake
        F = @(x) x.^(dop+1);
        figure
        I = open_Newton_Cotes(a,b,n_nodes,F);
        title(sprintf('interpolating x^%d with %d nodes',dop+1,n_nodes))
        legend(sprintf('x^%d',dop+1),'approx')
        I_true = (b^(dop+2)-a^(dop+2))/(dop+2);
        
        if abs(I - I_true) < 10^(-8) % check approx integral
            dop = dop + 1;
        else
            mistake = true;
        end
    end
    fprintf("formula for %d nodes, dop = %d\n",n_nodes,dop);
end