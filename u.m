function uOut = u(x, t, a, nTerms, c)

uOut = 0;

% --- Compute the sum in the Fourier solution formula:
for n=1:nTerms
    uOut = uOut+c(n)*exp(-a*n^2*pi^2*t)*sin(n*pi*x);
end

