function [Lx,Ly] = parametric_interpolant(interval,x,y,x_ax,param)

arguments
    interval
    x
    y
    x_ax
    param = "arc"
end

if param == "uniform"
    for i=0:length(x)-1
        t(i+1) = interval(1)+(interval(2)-interval(1))*i/(length(x)-1);
    end
else % arc
    d_sum = 0;
    for i=2:length(x)
        d(i-1) = sqrt(...
            (x(i)-x(i-1))^2+...
            (y(i)-y(i-1))^2);
        d_sum = d_sum + d(i-1);
    end
    t(1) = 0;
    for i=2:length(x)
        t(i) = sum(d(1:i-1))/d_sum;
    end
end

Lx = lagrange_interpolant(t,x,x_ax);
Ly = lagrange_interpolant(t,y,x_ax);

end

