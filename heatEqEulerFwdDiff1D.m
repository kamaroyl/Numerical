clear all;
close all;

% --- SET PARAMETERS:
nt = 402;  % Number of time grid points.
nx = 100;   % Number of spatial grid points.
T = 0.02;   % Final time.
a = 1;      % Diffusion constant.

g = @(x) exp(-(x-0.25)^2/0.005)+ ...
         3*exp(-(x-0.5)^2/0.005)+ ...
         2*exp(-(x-0.75)^2/0.005);  % Initial condition.
a = @(x) a.^4; % The "diffusion function", which gives the diffusion at 
            % location x

% --- INITIALIZE THE GRIDS:
k = T/(nt-1);   % Time step
h = 1/nx;      % Spatial step
x = linspace(0,1-h,nx);    % Grid in space 

disp('k/h^2: ')
k/h^2


% --- Initialize the second derivative matrix:
firstRow = zeros(1,nx);
firstRow(1) = -2;
firstRow(2) = 1;
firstRow(nx) = 1;
D2 = toeplitz(firstRow)/h^2;

% --- Initialize the diffusion operator: 
%     (a diagonal matrix with the values a(x) along the diagonal)
A = diag(a(x));


% --- Initialize the vectors to hold two consecutive time steps:
uk = zeros(nx,1);
ukp1 = zeros(nx,1);

% --- Plot the initial condition:
for l=1:nx
    uk(l) = g(x(l));
end
plot(x,uk,'LineWidth', 2);
axis([0,1,-0.1,3.1])
pause(1)        


% --- SOLVE THE EQUATION AND PLOT:
for n=2:nt
    ukp1 = uk+k*A*D2*uk;  % Euler fwd
    
    plot(x,ukp1,'LineWidth', 2);
    axis([0,1,-0.1,3.1])
    pause(0.05)
    
    uk = ukp1;  % Set the previous time step as the current time.
end