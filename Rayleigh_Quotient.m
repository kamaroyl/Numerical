clear all
close all
%Rayleigh Quotient
%Normalization
c=1/sqrt(2);
%Eigenvector
v=[1; -1]
%Matrix
A=(1/2)*[3 -1; -1 3];
d=v'
e=d*v
lambda=d*(A)*v
lambda=lambda/e