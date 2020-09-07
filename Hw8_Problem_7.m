clear all;
close all;


nx = 100;
nt = 200;
c = 1;
t_i = 0;
t_f = 2;
x_i = 0;
x_f = 1;
h = (x_f-x_i)/nx;
k = (t_f-t_i)/nt;
x = linspace(0,1,nx).';

k/h^2

%u(x,0)
f = @(x) exp(-1000*(x-0.5)^2); 
%u_t(x,0)
g = @(x) 0;

%Initialize u and u_t vector
u=zeros(nx,1);
u_t=zeros(nx,1);
u(1) = f(x_i);
u_t(1) = g(x_i);

for i=1:nx-1
    u(i+1) = f(x_i+h*i); 
    u_t(i+1) = g(x_i+h*i);
end

u_1=zeros(2*nx,1);

for m=1:nx-1
    u_1(m)=u(m);
    u_1(m+nx)=u_t(m);
end


L=BlkMtrx(nx,nx,x_i,x_f,c);

% --- Plot the initial condition:
plot(x,u,'LineWidth', 2);
axis([0,1,0,1])
pause(.05)  

u_2=zeros(2*nx,1);
A=expm(k*L);
u_sub = zeros(nx,1);

for j=2:nt-1
   u_2=A*u_1;
   for r=1:nx-1
       u_sub(r) = u_2(r);
   end
   plot(x,u_sub,'LineWidth', 2);
   axis([0,1,0,1])
   pause(0.05)
  
   u_1=u_2;
end




