
function[v] = tortuosity(p)
%clc;
%clear;

% Relations between Tortuosity and Porosity
%t = double(4);

t1 = 0.8*(1-p)+1;
t(1)=t1;

%a=0.19;
%pc=0.33;
%m=0.65;
%t2 = 1 + a*((1-p)/(p-pc)^m);
%t(2)=t2;

t3 = 1.8058 - 0.5191*(p^3) + 0.879*(p^2) - 1.1657*p;
t(2)=t3;

t4 = 1 - 0.49*log(p);
t(3)=t4;

v = sum(t)/length(t);



