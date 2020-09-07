clear all
close all
%Eigen vector approximation
v=[1; 1.0005]
%Matrix in question
A=(0.5).*[3 -1; -1 3];
d=v'
e=d*v
lambda=d*A*v
lambda=lambda/e