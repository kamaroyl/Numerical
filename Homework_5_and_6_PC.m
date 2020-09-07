clear all
close all

%Homework 5 and 6:Main function 
% the Lorenz equations:
% dx/dt = sigma*(y-x)
% dy/dt = x*(rho-z)-y
% dz/dt = x*y - beta*z

% - - - Initial Conditions and Initializations:
inp = input('ic1, ic2, ic3');
a = -25;
b = 25;
ny = 1000; 
sigma = 10;
rho = 28;
beta = 8/3;

h = abs(b-a)/ny;
y = zeros(3, ny);
for i=1:3
  
end
y_dot = zeros(3, ny);

% - - - Initializing the Required Descrete Times

% - - - Euler Forward 1st Order Accurate    
 for i=1:3
     y(i,1)=inp(i); 
     yd_temp = MyLorenz(y(:,1),sigma, rho, beta); 
     y_dot(i,2)=yd_temp(1,i);
     y(i,2) = y(i,1)+h*y_dot(i,1); 
 end

% - - - Leap Frog Method 2nd Order Accurate
 for i=1:3
     yd_temp = MyLorenz(y(:,2),sigma, rho, beta); 
     y_dot(i,3)=yd_temp(1,i);
     y(i,3) = y(i,1)+2*h*y_dot(i,2); 
 end
    
 for i=1:3
    yd_temp = MyLorenz(y(:,3),sigma, rho, beta); 
     y_dot(i,4)=yd_temp(1,i);
    y(i,4) = y(i,3)+(h/12)*(23*y_dot(i,3)-16*y_dot(i,2)+5*y_dot(i,1)); %AB 3 step Method 3rd Order Accurate
 end


% - - - Predictor Corrector 
for j =4:ny
    for i = 1:3
        yd_temp = MyLorenz(y(:,j),sigma, rho, beta); 
        y_dot(i,j)=yd_temp(1,i);
% - - - %4th order Adams-Bashforth Four-step method
        Predictor = y(i,j)+(h/24)*(55*y_dot(i,j)-59*y_dot(i,j-1)+37*y_dot(i,j-2)-9*y_dot(i,j-3));
% - - - %5th order Adams-Moulton Four-Step Method
        y(i,j+1) = y(i,j)+(h/720)*(251*Predictor+646*y_dot(i,j)-264*y_dot(i,j-1)+106*y_dot(i,j-2)-19*y_dot(i,j-3));
    end
end
plot(y(1,:),y(3,:))
title('Predictor corrector at 1000 grid points')
