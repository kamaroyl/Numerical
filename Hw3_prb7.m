clear all;
close all;

% --- Set Variables
nt = 50; %Temporal nodes
a = 0; %Lower bound
b = 5; %Upper bound
ic = 1; %initial condition

t = linspace(a, b, nt);
dy_dt = @(y) (-100)*y; %The first derivative


exactSolution = @(t) exp(-100*t); %Defining exact Solution

approxSolution = Foreward_Euler(dy_dt, ic, a, b, nt);
error = zeros(nt,1);
for j=1:nt
    x=j*((b-a)/nt);
    error(j)=abs(approxSolution(j)-exactSolution(x));
end

max(error)

figure(1)
plot(t, exactSolution(t), '--', t, approxSolution, 'o')
axis([0, 5, -1000, 1000])
legend('Exact Solution', 'Approximate Solution')
title('exact and approximate solutions')

figure(2)
plot(t, error)
axis([0, 5, 0, 10e+10])
title('error')