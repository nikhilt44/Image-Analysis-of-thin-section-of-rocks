

function[] = diff_eq(numx,numt,mu,sigma)
clc;
clear;
%number of grid points in x
%numx = 101;

%number of time steps 
%numt = 2000; 
display(numx);

dx = 1/(numx - 1);
dt = 0.00005;

%vector of x values
x = 0:dx:1;   

%initialize everything to zero
C = zeros(numx,numt);   

%Values for mu and sigma for gaussian distribution
%mu = 0.5;
%sigma = 0.05;

% initial condition -> gaussian distribution
for i=2:numx-1
   C(i,1) = exp(-(x(i)-mu)^2/(2*sigma^2)) / sqrt(2*pi*sigma^2);
end

%t(1)=0
t(1) = 0;

% Iterate over difference equation
% Boundary Conditions -> C(1,j) and C(numx,j) remain 0
for j=1:numt
   t(j+1) = t(j) + dt;
   for i=2:numx-1
      C(i,j+1) = C(i,j) + (dt/dx^2)*(C(i+1,j) - 2*C(i,j) + C(i-1,j)); 
   end
end

figure(1);
hold on;
plot(x,C(:,1));
plot(x,C(:,11));
plot(x,C(:,101));
plot(x,C(:,1001));
plot(x,C(:,2001));
xlabel('x');
ylabel('c(x,t)');
