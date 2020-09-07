clear;
close all;

% --- Set parameters:
nt = 50;        % Number of time steps
a = 0;
b = 5;           % Total time (86400 s is one day)
y0 = 1;           % Initial condition in y (m)

% --- Initialize:
h = (b-a)/nt;   %Initialize the time grid:
t = linspace(a, b, nt);

y = zeros(nt,1);  % Store the solution for all time
                    % steps in this matrix
f = @(y) sqrt(-1)*2*pi*y;
y(1)=y0;
y(2)=y(1)+h*f(y(1));
for i=2:nt-1
    y(i+1) = y(i-1)+2*h*f(y(i));
end
y_real=real(y);
plot(t, y_real)
