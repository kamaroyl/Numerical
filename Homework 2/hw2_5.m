clear all;
close all;

% --- Set parameters:
n = 33;  % Number of grid points.
a = 0;  
b = 1;  % a and b specify the extent of the grid.

h = (b-a)/n;
x = linspace(a,b-h,n).';        % The .' tranposes the vector
                                % generated by linspace to a column vector.
                                % Note that we generate a "periodic grid".



% --- Generate a first derivative matrix:
row = zeros(1,n);  % Initialize n row vector of length
                   % n with zeros.
row(2) = 1;
row(n) = -1;
                   
col = zeros(n,1);  % Initialize n column vector of length
                   % n with zeros.
col(2) = -1;
col(n) = 1;

D1 = toeplitz(col,row)/(2*h);
                   

f = zeros(n,1);
df_dx = zeros(n,1);
for j=1:n
    if x(j)<0.5
        f(j)=2*x(j);
         df_dx(j)=2;
    else
        f(j)=1-2*(x(j)-0.5);
        df_dx(j)=-2;
    end
end


D1x = D1*f;      % We need f(x) to be a column vector here.
                    % That's why we transposed linspace above.

error = D1x-df_dx;

figure(1)
plot(x,df_dx)
title('Exact result')

figure(2)
plot(x,D1x)
title('Approximate result')

figure(3)
plot(x,error)
title('Error')