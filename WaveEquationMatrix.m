%This is a function that constructs the block diagonal matrix, it takes in
%the variables 
%n - first indice of the matrix
%m - second indece of the matrix
%h - step size
%c - constant
function L = WaveEquationMatrix( n, m, h, c )
%square the constant (for wave equation)
c_sqr=c^2;

%Construct the derivative matrix 
row=zeros(1,n);
row(1)=-2;
row(2)=1;

col=zeros(n,1);
col(1)=-2;
col(2)=1;
%The derivative matrix
D = ((1/h)^2).*toeplitz(col,row);
L_temp = c_sqr.*D;
% construct the other blocks
I = eye(n);
A = zeros(2*n,2*m);
%Populate our block matrix
for i=1:n
    for j=1:m
        A(i,j+n)=I(i,j);
        A(i+n,j)=L_temp(i,j);
    end
end
L = A;
end

