clear all;
close all;

% --- Set parameters:
n = 8;  % Number of grid points.
a = 0;  
b = 1;  % a and b specify the extent of the grid.

h = (b-a)/n;
x = linspace(a,b-h,n).';        % The .' tranposes the vector
                                % generated by linspace to a column vector.
                                % Note that we generate a "periodic grid".



% --- Generate a first derivative matrix:
row = zeros(1,n);  % Initialize n row vector of length
                   % n with zeros.
row(2) = 8;
row(3) = -1;
row(7) = 1;
row(n) = -8;
                   
col = zeros(n,1);  % Initialize n column vector of length
                   % n with zeros.
col(2) = -8;
col(3) = 1;
col(7) = -1;
col(n) = 8;

D1 = toeplitz(col,row)/(24*h);
                   

f = @(x) cos(2*pi*x);
df_dx = @(x) -2*pi*sin(2*pi*x); % The exact result

 
                                
D1x = D1*f(x);      % We need f(x) to be a column vector here.
                    % That's why we transposed linspace above.

error = D1x-df_dx(x);

figure(1)
plot(x,df_dx(x))
title('Exact result')

figure(2)
plot(x,D1x)
axis([0,1,-8,8])
title('Approximate result')

figure(3)
plot(x,error)
axis([0,1,-0.1,0.1])
title('Error')