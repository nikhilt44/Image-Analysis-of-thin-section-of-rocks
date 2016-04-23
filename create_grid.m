
function [grid,horiz_lines,vert_lines]=create_grid(sample)

%clc();
%clear;
[s1,s2,s3]=size(sample);
%display(s1);
%display(s2);
grid = zeros(s1,s2);
count=1;
vert_lines=0;
horiz_lines=0;
% s1-height
% s2-width

for I=1:s1
    for J=1:s2
        if(count==15)  %change the no of vertical grid lines
            grid(I,J)=1;
            vert_lines=vert_lines+1;
            count=1;
        else
            count=count+1;
        end    
    end
    count=1;
end 

count=1;
for I=1:s2
    for J=1:s1
        if(count==17)  %change the no of horizontal grid lines
            grid(J,I)=1;
            horiz_lines=horiz_lines+1;
            count=1;
        else
            count=count+1;
        end    
    end
    count=1;
end 

%figure,imshowpair(sample,grid);
horiz_lines=horiz_lines/s2;
vert_lines=vert_lines/s1;


