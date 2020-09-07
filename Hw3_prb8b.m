clear all;
close all;

% --- Set Variables
nt = 50000; %Temporal nodes
a = 0; %Lower bound
b = 50; %Upper bound
ic = 1; %initial condition

t = linspace(a, b, nt);
dy_dt = @(y) sqrt(-1)*2*pi*y; %The first derivative


exactSolution = @(t) real(exp(sqrt(-1)*2*pi*t)); %Defining exact Solution

approxSolution = Foreward_Euler(dy_dt, ic, a, b, nt);

error = zeros(nt,1);
approxSolutionReal=zeros(nt,1);


for j=1:nt
    x=j*((b-a)/nt);
    approxSolutionReal(j)=real(approxSolution(j));
    error(j)=abs(real(approxSolution(j))-real(exactSolution(x)));
end


figure(1)
plot(t, exactSolution(t), '--', t, approxSolutionReal, 'o')
axis([0, 50, -4, 4])
legend('Exact Solution', 'Approximate Solution')
title('exact and approximate solutions')

figure(2)
plot(t, error)
axis([0, 50, 0, 2.5])
title('error')