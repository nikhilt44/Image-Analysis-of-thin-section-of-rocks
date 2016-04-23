
function[] = start(s)
%clear;
%clc;
%display(s);
% Specify the path where images are stored
src = dir('/Users/nikhilthakur/Desktop/samples/sample_set_1/*.png');
%src = dir('s/*.png');
 number_of_samples;
number_of_samples = length(src);
set(handles.edit2,'String',number_of_samples);

%display(number_of_samples);
fprintf('Program paused. Press enter to continue.\n');
pause;

porosities = double(length(src));
ssas = double(length(src));
permeas = double(length(src));

for i = 1 : length(src)
    filename = strcat('/Users/nikhilthakur/Desktop/samples/sample_set_1/',src(i).name);
    I = imread(filename);
    figure,imshow(I);
    % Compute properties
    [porosities(i),ssas(i)] = Main(I); 
end


% Unitless
display(porosities);
avg_porosity = sum(porosities)/length(porosities);
display(avg_porosity);



fprintf('Program paused. Press enter to continue.\n');
pause;
% Unit:cm^-1
display(ssas);
avg_ssa = sum(ssas)/length(ssas);
display(avg_ssa);



fprintf('Program paused. Press enter to continue.\n');
pause;
% Tortuosity estiation using its relationships with porosity
% Unitless
[tor] = tortuosity(avg_porosity/100);
display(tor);
avg_tortuosity = sum(tor)/length(tor);



fprintf('Program paused. Press enter to continue.\n');
pause;
% Permeability Estimation
% Unit:mD(Milli Darcies/m^2/cm^2)
[p1] = permea(avg_ssa,avg_porosity/100,avg_tortuosity);
fprintf('Permeability in cm^2.\n');
display(p1);



fprintf('Program paused. Press enter to continue.\n');
pause;
% Bulk Density using its relationship with porosity
% Unit:g*cm^-3
fprintf('Bulk Density in cm^-3.\n');
D = (2.156 - avg_porosity)/0.756;
display(D);


% Comparison of relationships betweeen porosity and tortuosity
% p1 = 10.78;
% p2 = 12.3;
% p3 = 14.24;
% p4 = 18.5;
% p5 = 22.3;
% p6 = 26.35;
% p7 = 28.52;
% p = [p1,p2,p3,p4,p5,p6,p7];
% [tor] = tortuosity(p1/100);
% [tor1] = tortuosity(p2/100);
% [tor2] = tortuosity(p3/100);
% [tor3] = tortuosity(p4/100);
% [tor4] = tortuosity(p5/100);
% [tor5] = tortuosity(p6/100);
% [tor6] = tortuosity(p7/100);
% 
% plot(p1,tor,'--gs','MarkerEdgeColor','b'); hold on;
% plot(p2,tor1,'--gs','MarkerEdgeColor','b'); hold on;
% plot(p3,tor2,'--gs','MarkerEdgeColor','b'); hold on;
% plot(p4,tor3,'--gs','MarkerEdgeColor','b'); hold on;
% plot(p5,tor4,'--gs','MarkerEdgeColor','b'); hold on;
% plot(p6,tor5,'--gs','MarkerEdgeColor','b'); hold on;
% plot(p7,tor6,'--gs','MarkerEdgeColor','b');
% title('Plot of Porosity vs Tortuosity ');
% xlabel('Porosity') % x-axis label
% ylabel('Tortuosity') % y-axis label

fprintf('End\n');




