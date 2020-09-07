clear all
close all
n=8;
row = zeros(1,25);
row(2) = 0.5;

col = zeros(n,1);
col(2) = -0.5;


D1 = toeplitz(row,col);
A=zeros(8,25);
c=D1*A