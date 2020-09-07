clear all;
close all;

% Set Parameters:
nt = 100; %Number of Temporal Grid Points
nr = 100; %Number of Spatial Grid Points
n_theta;  %Number of Degree Grid Points
T = 3.0; %Final Time
c = 1; %Speed
nIntegrationTerms = 100; %Number of Nodes for the IntegrateTrapazoidal Routine
nFourier = 100; %Number of Fourier Terms




% --- INITIALIZE THE GRIDS:
t = linspace(0,T,nt); %Initial Time, End Time, Spacing
r = linspace(-8,8,nr); %Left End point, Right End Point, Spacing
theta = linspace(0, 2*pi, n_theta);

uStore=zeros(nx,nt); %Initialize Storage Matrix

for j=1:nt; %loop over time
    
    uTemp=zeros(nx,1);
    for k=1:nx; %loop over space
        a = x(k) - c*t(j); %lower integration value
        b = x(k) + c*t(j); %upper integration value
         uStore(k,j) = integrateTrapezoidal(df_dx,a,b,nIntegrationTerms);
         uTemp(k)=uStore(k,j);
             
    end

        plot(x, uTemp);
        axis([-8, 8, -2, 2])
        pause(0.1)   %How long of a pause between frames
    
end

