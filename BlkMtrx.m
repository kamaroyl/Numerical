%This is a function that constructs the block diagonal matrix, it takes in
%the variables 
%n - first indice of the matrix
%m - second indece of the matrix
%h - step size
%c - constant
function L = BlkMtrx( n, m, x_i, x_f, c )
%square the constant (for wave equation)

c_sqr=c^2;

%Construct the derivative matrix 
D=PSD(n,m,x_i,x_f);

%The derivative matrix
D=c_sqr.*D;

% construct the other blocks
I = eye(n);
A = zeros(2*n,2*m);

%Populate our block matrix
for i=1:n
    for j=1:m
        A(i,j+n)=I(i,j);
        A(i+n,j)=D(i,j);
    end
end
L = A;
end

