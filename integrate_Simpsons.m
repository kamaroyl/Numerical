function out = integrateSimpsons(g, a, b, n)

h = (b-a)/(n-1);        % Compute the grid spacing.

% --- Sum using the Composite Trapezoidal formula:
out = (1/3)*g(a);
for k=2:2:n-2
    out = out+g(a+k*h);
end
for k=3:2:n-1
out = out+(1/3)*g(b);

out = h*out;
