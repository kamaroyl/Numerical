function L = PSD( n, m, x_i, x_f )
D=zeros(n,m);
%x = linspace(x_i,x_f,n);
h=(x_f-x_i)/n;
for i=1:n
    for j=1:m
        if(i==j)
            
                D(i,j)=(-((pi)^2)*((n^2)+2)/3);
                
        else
                D(i,j)=(2*((pi)^2)*((-1)^(i+j+1)))/((sin(pi*(h*(i-1)-h*(j-1))))^2); 
                
        end
    end
end
L=D;
end