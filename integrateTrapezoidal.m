function out = integrateTrapezoidal(g, a, b, n)

h = (b-a)/(n-1);        % Compute the grid spacing.

% --- Sum using the Composite Trapezoidal formula:
out = 0.5*g(a);
for k=2:n-1
    out = out+g(a+k.*h);
end
out = out+0.5*g(b);

out = h.*out;
