function [I] = composite_Newton_Cotes(X,nodes_per_interval,F,plot_it)
%composite_Newton_Cotes
arguments
    X,nodes_per_interval,F
    plot_it = true
end

% recursively compute Sm+1
% (formula (76) if nodes_per_interval = 2 
% or (78) if nodes_per_interval = 3)
I = 0;
for m=1:length(X)-1
    I = I + closed_Newton_Cotes(X(m),X(m+1),nodes_per_interval,F,plot_it);
end

end

