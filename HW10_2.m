clear all
close all

%------Power Method------
n=20;
%The Matrix
A=(0.5).*[3 -1; -1 3];

%initialize random numbers for the vector
a=rand;
b=rand;

%Vector
v=[a; b];

%Apply the matrix many times
for i=1:n
v=A*v;
v1=v(1);
v2=v(2);
%Find the norm (infinity)
Normv=max(v1,v2); 
%Normalize
v=v/Normv;
end
v
