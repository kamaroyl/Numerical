clear;
close all;

% --- Set parameters:
G = 6.67*10^(-11);  % Gravitational constant
M = 5.98*10^(24);   % Earth's mass (kg)
R = 6357000;        % Earth's radius (m)

nt = 100000;        % Number of time steps
T = 86400;          % Total time (86400 s is one day)
x0 = -2*R;          % Initial condition in x (m)
y0 = 2*R;           % Initial condition in y (m)
vx0 = -5000;        % Initial velocity in x (m/s)
vy0 = 0;            % Initial velocity in y (m/s)

% --- Initialize:
mu = G*M;           % Constant used by the RHS f
h = T/nt;   %Initialize the time grid:
y = zeros(4,nt+1);  % Store the solution for all time
                    % steps in this matrix
    
y(:,1) = [x0 ; vx0 ; y0 ; vy0]; % Set the initial condition.
                                
% --- Run Euler forward for one step:
y(:,2) = y(:,1)+h*f(mu,y(:,1));

% --- Run Leap-frog for the remaining time steps:
for k=2:nt
    y(:,k+1) = y(:,k-1)+2*h*f(mu,y(:,k));
    
    % --- For plotting:
    if mod(k,1000) == 0 % Only plot every 1000:th time step
        figure(1)
        plot(y(1,1:k+1)/R,y(3,1:k+1)/R, 'linewidth', 2)
        axis([-10 10 -10 10])
        axis('square')
        xlabel('x')
        ylabel('y')
        title('Solution y(t) vs. x(t)')
    end
end

t = linspace(0,T,nt+1);
figure(2)
subplot(211)
plot(t,y(1,:), 'linewidth', 2)
title('x(t)')
subplot(212)
plot(t,y(3,:), 'linewidth', 2)
title('y(t)')