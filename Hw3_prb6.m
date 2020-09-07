clear all;
close all;


% --- Set Variables
nt = 10; %Temporal nodes
a = 0; %Lower bound
b = 1; %Upper bound

h = (b-a)/(nt); %The change

t = linspace(0, 1, nt);
y = zeros(nt,1); %function
y(1)=1; %Initial condition

exactSolution = @(t) exp(t);

for k=1:(nt-1);
    y(k+1)=y(k)+h*y(k);
end
    plot(t, exactSolution(t), '--', t, y, 'o')
    axis([0,1,0,3])
    legend('Exact Solution', 'Approximate Solution')
    
    exactSolution(1)
    y(nt)
    error = zeros(nt,1);
for j=1:nt
    x=(j)*h
    error(j)=abs(y(j)-exactSolution(x));
end
max(error)