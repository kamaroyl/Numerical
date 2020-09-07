clear all
close all

%------Inverse Power Method------
n=20;
alpha = 4;
%The Matrix
A=(0.5).*[3 -1; -1 3];
A_prime=A-alpha*eye(2,2)
%initialize random numbers for the vector
a=rand;
b=rand;

%Vector
v=[a; b];

%Apply the matrix many times
for i=1:n
v=A_prime*v;
v1=v(1);
v2=v(2);
%Find the norm (infinity)
Normv=max(v1,v2); 
%Normalize
v=v/Normv;
end
v
