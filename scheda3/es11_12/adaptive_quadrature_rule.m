function [I] = adaptive_quadrature_rule(a,b,F,tol,I,splits)
%ES11_ADAPTIVE_QUADRATURE_RULE 
arguments
    a,b,F
    tol = 10^(-3) % tolerance under which to stop splitting
    I = 0 % starting integral value
    splits = 0 % how many times the interval was split
end

% use S5 and S9
n_nodes = 9;
[err,I_] = Runge_error(a,b,n_nodes,F);

if err > tol
    I = adaptive_quadrature_rule(a,(a+b)/2,F,tol,I,splits+1);
    I = adaptive_quadrature_rule((a+b)/2,b,F,tol,I,splits+1);
else
    % finished splitting subinterval
    % update integral value
    I = I + I_;
    
    % plot subinterval split level
    % WARNING: plotting makes it a lot slower
    hold on
    plot([a,b],[splits,splits],'black','LineWidth',1.5)
    legend("splits per interval")

    % uncomment this to plot F and all the generated trapezoids
	% WARNING: use a high tol or pc may crash
    composite_Newton_Cotes(linspace(a,b,n_nodes),2,F);
    legend("splits per interval",...
        replace(char(F),{'@(x)','.'},''),...
        'approx')
end

end
