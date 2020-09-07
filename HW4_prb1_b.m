clear;
close all;

% --- Set parameters:
nt = 50000;        % Number of time steps
a = 0;
b = 50;           % Total time (86400 s is one day)
y0 = 1;           % Initial condition in y (m)

% --- Initialize:
h = (b-a)/nt;   %Initialize the time grid:
t = linspace(a, b, nt);

y = zeros(nt,1);  % Store the solution for all time
                    % steps in this matrix
f = @(y) sqrt(-1)*2*pi*y;

y_exact= @(t) real(exp(i*2*pi*t));
y(1)=y0;
y(2)=y(1)+h*f(y(1));
for i=2:nt-1
    y(i+1) = y(i-1)+2*h*f(y(i));
end
y_real=real(y);

for j=1:nt-1
    t_temp = j*h;
    error = abs(y_real(j)-y_exact(t_temp));
end

figure(1)
plot(t,y_exact(t))
title('exact solution')

figure(2)
plot(t, y_real)
title('approximate Solution')
axis([0, 50, -1, 1])

figure(3)
plot(t, error)
title('error')