
function [ssa]=specific_area(grid,sample,horiz_lines,vert_lines,porosity)

no_of_inter=0;
magnification=12.5;

[s1,s2,s3]=size(sample);

% s1-height
% s2-width

 for I=1:s1
    for J=1:s2
        if(sample(I,J)==1 && grid(I,J)==1)
           no_of_inter=no_of_inter+1;
        end
    end
 end
 

L = horiz_lines*s2*0.026 + vert_lines*s1*0.026;
%display(L);
ssa = (2*no_of_inter*magnification)/L;  % 1 pixel = 0.026 cm





