n = 33;  % Number of grid points.
a = 0;  
b = 1;  % a and b specify the extent of the grid.

h = (b-a)/n;
x = linspace(a,b-h,n).';        % The .' tranposes the vector

f = zeros(n,1);
for i=1:n
    if x(i)<0.5
        f(i)=2*x(i);
    else
        f(i)=1-2*(x(i)-0.5);
    end
end
f