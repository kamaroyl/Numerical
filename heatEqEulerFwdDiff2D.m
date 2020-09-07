clear all;
close all;

% --- SET PARAMETERS:
nt = 700;  % Number of time grid points.
nx = 100;   % Number of spatial grid points.
ny = nx;
T = 0.01;   % Final time.


g = @(x,y) exp(-(x-0.75)^2/0.005-(y-0.25)^2/0.005)+...
    exp(-(x-0.25)^2/0.005-(y-0.75)^2/0.005)+...
    exp(-(x-0.25)^2/0.005-(y-0.25)^2/0.005)+...
    exp(-(x-0.75)^2/0.005-(y-0.75)^2/0.005)+...
    exp(-(x-0.5)^2/0.005-(y-0.5)^2/0.005);  % Initial condition.
a = @(x,y) sin(x)+cos(y); 


% --- INITIALIZE THE GRIDS:
k = T/(nt-1);   % Time step

h = 1/(nx-1);      % Spatial step
x = linspace(0,1,nx);    % Grid in space
y = linspace(0,1,ny);    % Grid in space

disp('k/h^2')
k/h^2


% --- Set the diffustion throughout the domain:
aMatrix = zeros(nx,ny);
for m=1:nx
    for n=1:ny
        aMatrix(m,n) = a(x(m),y(n));
    end
end
figure(1)
imshow(aMatrix)
title('Diffusion function a(x,y)')

% --- Initialize the vectors to hold two consecutive time steps:
uk = zeros(nx,ny);
ukp1 = zeros(nx,ny);

% --- Plot the initial condition:
for m=1:nx
    for n=1:ny
        uk(m,n) = g(x(m),y(n));
    end
end
figure(2)
surf(x,y,uk);
axis([0,1,0,1,0,1])
%imshow(uk)
pause(1)  




% --- SOLVE THE EQUATION AND PLOT:
for i=2:nt

    for m=2:nx-1
        for n=2:ny-1
            ukp1(m,n) = uk(m,n)+ ...
                        aMatrix(m,n)*(k/h^2)*(uk(m-1,n)+...
                                 uk(m+1,n)+...
                                 uk(m,n-1)+...
                                 uk(m,n+1)-...
                                 4*uk(m,n));
        end
    end
    figure(2)
    surf(x,y,ukp1);
    axis([0,1,0,1,0,1])
    %imshow(ukp1)
    pause(0.05)
    
    uk = ukp1;  % Set the previous time step as the current time.
    
end