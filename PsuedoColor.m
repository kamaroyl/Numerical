function [ Blur] = PsuedoColor( b,nt, T, Im, Ed  )

%- - - - Initialization - - - -
% size is dependent on the Image
Size=size(Im);
nx = Size(1);   
ny = Size(2);
a=zeros(nx,ny);
%Image as function, and diffusion coefficient edges
%We see that 
for i=1:nx
    for j=1:ny
        a(i,j) = 1-b*Ed(i,j); 
    end
end


% --- INITIALIZE THE GRIDS:
k = T/(nt-1);   % Time step

h = 1/(nx-1);      % Spatial step


% --- Initialize the vectors to hold two consecutive time steps:
uk = Im;
ukp1 = zeros(nx,ny);


% --- SOLVE THE EQUATION AND PLOT:
for i=2:nt

    for m=2:nx-1
        for n=2:ny-1
            ukp1(m,n) = uk(m,n)+ ...
                        a(m,n)*(k/h^2)*(uk(m-1,n)+...
                                 uk(m+1,n)+...
                                 uk(m,n-1)+...
                                 uk(m,n+1)-...
                                 4*uk(m,n));
        end
    end
   % figure(2)
    %imshow(ukp1)
    %pause(0.05)
    
    uk = ukp1;  % Set the previous time step as the current time.
    
end
f=zeros(nx,ny);
for i=1:nx
    for j=1:ny
        f(i,j)=abs(uk(i,j));
    end
end

Blur=f;
end

