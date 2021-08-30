function [x_ax,F] = uniform_trigonometric_interpolation(x,f)
%UNIFORM_TRIGONOMETRIC_INTERPOLATION 

x_ax = linspace(min(x),max(x),1000);

n = (length(x)-1);
m = ceil(n/2); % IMPORTANT: round up when n is odd

F = 1/(n+1) * sum(f);
for k=1:m
    a = 2/(n+1) * sum(f.*cos(k*x));
    b = 2/(n+1) * sum(f.*sin(k*x));
    if k<m || ~mod(n,2) % change formula for even nodes number
        F = F+a*cos(k*x_ax)+b*sin(k*x_ax);
    else
        F = F+a/2*cos(k*x_ax);
    end
end

end

