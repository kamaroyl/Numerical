clear all;
close all;

% Set Parameters:
nt = 100; %Number of Temporal Grid Points
nx = 100; %Number of Spatial Grid Points
T = 3.0; %Final Time
c = 1; %Speed
nIntegrationTerms = 100; %Number of Nodes for the IntegrateTrapazoidal Routine


%f = @(x) 
df_dx = @(x) exp(-((x-0.5).^2)./0.005)+3*exp(((-(x).^2))/0.005)+2*exp(-((x+0.5).^2)/0.005);  % Initial condition.

% --- INITIALIZE THE GRIDS:
t = linspace(0,T,nt); %Initial Time, End Time, Spacing
x = linspace(-8,8,nx); %Left End point, Right End Point, Spacing

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

