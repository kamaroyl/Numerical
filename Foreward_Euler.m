function [y,t] = Foreward_Euler(f, ic, a, b, n) %takes in function, initial condition, 
                                                %left bound, right bound and number of nodes
h = (b-a)/n;
t = linspace(a,b,n); %initialize time
y = zeros(n,1);%initialize space
y(1)=ic;

for k=1:(n-1);
    tempvar = y(k);
    y(k+1)=y(k)+h*f(tempvar);
end
end



