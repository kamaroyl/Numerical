clear all
close all

%Homework 5 and 6:Main function 
% the Lorenz equations:
% dx/dt = sigma*(y-x)
% dy/dt = x*(rho-z)-y
% dz/dt = x*y - beta*z

% - - - Initial Conditions and Initializations:
inp = input('ic1, ic2, ic3');
a = -25; %left spatial bound
b = 25; %right spatial bound
nt = 10000; %time nodes
sigma = 10; %The system parameters
rho = 28;
beta = 8/3;
init_y = zeros(3);
h = abs(b-a)/nt;
y = zeros(3,nt);

for i=1:3
  y(i,1) = inp(i); %Initial conditions of the differential equations
end
for j = 1:nt
     s_1 = MyLorenz(y(:,j),sigma,rho,beta); %These are the parts of the Runge Kutta 4
     s_2 = MyLorenz(y(:,j),sigma,rho,beta)+(h/2)*s_1;
     s_3 = MyLorenz(y(:,j),sigma,rho,beta)+(h/2)*s_2;
     s_4 = MyLorenz(y(:,j),sigma,rho,beta)+h*s_3;
    for i=1:3
        y_temp = y(i,j);
      
        y(i,j+1)=y_temp+(h/6)*(s_1(i)+2*s_2(i)+2*s_3(i)+s_4(i)); %Here's the rest of the RK4
    end
    
    
end
plot(y(1,:),y(3,:))
     
