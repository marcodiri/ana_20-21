clear

% draw circle
r=1;
x=0;y=0;
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);
hline(0)

n = 9; % number of points
for i=0:n
    pts(i+1)=pi/2*(2*i+1)/(10);
end
% draw points on circle
xpts = r * cos(pts) + x;
ypts = r * sin(pts) + y;
scatter(xpts,ypts)

% draw points on x axis
scatter(cos(pts),zeros(1,n+1))

% draw Chebyshev poly Tn+1(x)
T = @(x) cos((n+1)*acos(x));
x_ax = linspace(-1,1,1000);
plot(x_ax,T(x_ax))