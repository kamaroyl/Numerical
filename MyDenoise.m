% ||My Denoise takes three constants and two matricies||%
% ||b = diffusion const (a(x,y)=1-b*E(x,y))           ||%
% ||nt = time step                                    ||%
% ||T = final time                                    ||%
% ||Im = the image to be acted upon                   ||%
% ||Ed = the edge mapping of said image               ||%
%-------------------------------------------------------%
function [ Blur] = MyDenoise( b,nt, T, Im, Ed  )


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
        a(i,j) = 1-(b.*Ed(i,j)); 
    end
end


% --- INITIALIZE THE GRIDS:
% Time steps
k = T/(nt-1);   
% Spatial steps
h_x = 1/(nx-1);
h_y = 1/(ny-1);
%The combination of space and time steps
const_x=k/(h_x^2);
const_y=k/(h_y^2);
%computed to obtain the stability
const_x+const_y

% --- Initialize the vectors to hold two consecutive time steps:
uk = Im;
ukp1 = zeros(nx,ny);


% --- SOLVE THE EQUATION AND PLOT:
for i=2:nt

    for m=2:nx-1
        for n=2:ny-1
            ukp1(m,n) = uk(m,n)+ ...
                        a(m,n)*(const_x*(uk(m-1,n)+...
                                 uk(m+1,n)-...
                                 2*uk(m,n))+...
                                 const_y*(uk(m,n-1)+...
                                 uk(m,n+1)-...
                                 2*uk(m,n)));
        end
    end
   % figure(2)
    %imshow(ukp1)
    %pause(0.05)
   % Set the previous time step as the current time. 
    uk = ukp1;  
    
end
f=zeros(nx,ny);
for i=1:nx
    for j=1:ny
        f(i,j)=abs(uk(i,j));
    end
end

Blur=f;
end

