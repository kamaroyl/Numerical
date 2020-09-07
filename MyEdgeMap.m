function R = MyEdgeMap( Im, Size  )
n=Size(1);
m=Size(2);

%First Order Derivative stencil
row = zeros(m,1);
row(2) = 0.5;
col = zeros(1,n);
col(2) = -0.5;
B = toeplitz(row,col);

%Application of the Stencil, taking the absolute value of the elements
D=B*Im;
for i=1:n
    for j=1:m
        e=D(i,j);
        D(i,j)=abs(e);
    end
end
E=zeros(n,m);
%Truncating the image back to original size
for i=1:n
    for j=1:m
        
        E(i,j)=D(i,j);
    end
end
R=E;
end

