clc;
clear;
p1 = 10.78;
p2 = 12.3;
p3 = 14.24;
p4 = 18.5;
p5 = 22.3;
p6 = 26.35;
p = [p1,p2,p3,p4,p5,p6];
[tor] = tortuosity(p1/100);
[tor1] = tortuosity(p2/100);
[tor2] = tortuosity(p3/100);
[tor3] = tortuosity(p4/100);
[tor4] = tortuosity(p5/100);
[tor5] = tortuosity(p6/100);
t = [tor,tor1,tor2,tor3,tor4,tor5]; 
plot(p1,tor,'--gs','MarkerEdgeColor','b'); hold on;
plot(p2,tor1,'--gs','MarkerEdgeColor','k'); hold on;
plot(p3,tor2,'--gs','MarkerEdgeColor','g'); hold on;
plot(p4,tor3,'--gs','MarkerEdgeColor','r'); hold on;
plot(p5,tor4,'--gs','MarkerEdgeColor','b'); hold on;
plot(p6,tor5,'--gs','MarkerEdgeColor','k');
%plot(p,t);