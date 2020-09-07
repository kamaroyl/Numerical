clear all;
close all;
n=100;
c=1;
x_i=0;
x_f=1;
h=(x_f-x_i)/n;
x=linspace(x_i,x_f,n);
f = @(x) cos(4*pi*x);
g = @(x) (-16*(pi^2))*cos(4*pi*x);
u = zeros(n,1);
u_xx = zeros(n,1);
for i=1:n
    u(i)=f(x_i+h*(i-1));
    u_xx(i)=g(x_i+h*(i-1));
end

A=PSD(n,n,x_i,x_f);
r=A*u;

figure(1)
plot(x,r)

figure (2)
plot(x,u_xx)

epsilon = zeros(n,1);
for j=1:n
    epsilon(j) = abs(r(j)-u_xx(j));
end
max(epsilon)
