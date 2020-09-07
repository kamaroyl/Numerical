clear all;
close all;

% --- SET PARAMETERS:
nt = 100;   % Number of time grid points.
nx = 100;   % Number of spatial grid points.
T = 0.02;    % Final time.
a = 1;      % Diffusion constant.
nIntegrationTerms = 100;    % Number of node points to use for the
                            % quadrature routine.
nFourierTerms = 20;         % Number of terms to use in the Fourier 
                            % expansion.

f = @(x) exp(-((x-0.25)^2)/.005)+3*exp(-((x-0.5)^2)/0.005)+2*exp(-((x-.75)^2)/0.005);  % Initial condition.


% --- INITIALIZE THE GRIDS:
t = linspace(0,T,nt);
x = linspace(0,1,nx);


% --- Pre-compute the coefficients c:
c = zeros(nIntegrationTerms,1);
for n=1:nFourierTerms
    g = @(x) f(x)*sin(n*pi*x);
    c(n) = 2*integrateTrapezoidal(g, 0, 1, nIntegrationTerms);
end


% --- PRODUCE THE SEQUENCE OF PLOTS:
for k=1:nt
    uTmp = zeros(nx,1);
    for l=1:nx
        uTmp(l) = u(x(l),t(k), a, nFourierTerms, c);      
    end
    plot(x,uTmp);
    axis([0,1,-0.1,3.1])
    pause(0.1)      % Pause each plot for 0.1 seconds, in order to
                    % create a "smooth" movie.
end




