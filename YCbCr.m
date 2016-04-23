
function[porosity,ssa] = YCbCr(im,str,x,count)

%clear;
%clc;
%Input='sample1.jpg';

%im = imread(Input);
%figure,imshow(im);

%figure,imshow(im);
[s1,s2,s3]=size(im);
BW=zeros(s1,s2);

%----------------------------------------------------------------------
% Based on user defined threshold or from any thresholding algorithm
% Thresholding can be done on Grayscale image or YCBCR image(prefered)
% YCBCR image gives better results
%----------------------------------------------------------------------

Y=rgb2ycbcr(im);
%figure,imshow(Y);
t=137;
for I=1:s1
    for J=1:s2
        if Y(I,J,2)>t
            BW(I,J)=1;
        end
    end
end



% Denoising after thresholding
f1 = strel(str,x);
c = imopen(BW,f1);
f = imclose(c,f1);
sample1 = medfilt2(f);

%x = logical(sample1);
f = strcat('/Users/nikhilthakur/Desktop/results/',num2str(count));
h = strcat(f,'.jpg');
%display(h);
imwrite(sample1,h,'jpg');
count=count+1;

% Connected Componenets - No of Pores
%C = bwconncomp(sample1);
%display(C);

% Area
%A  = regionprops(sample1,'area');
%A=bwarea(sample1);
%display(A);

% n largest pores
%sample2 = bwareafilt(x,5,'largest');
%figure,imshow(sample2);


% Porosity Calculation
porosity=(sum(sum(sample1)/(s1*s2)*100));
%display(porosity);

%-----------------------------------------------------------
%-----------------------------------------------------------


% Edge Detection
f2 = strel('octagon',3);
F=imerode(sample1,f2);  % Erode
e = sample1 - F;
%figure,imshow(e);
f = strcat('/Users/nikhilthakur/Desktop/results/',num2str(count+20));
h = strcat(f,'.jpg');
imwrite(e,h,'jpg');


% Creating a Grid for Specific Surface Area
[grid,horiz_lines,vert_lines] = create_grid(e);

%figure,imshowpair(e,grid);

% Calculating Specific Surface Area
[ssa] = specific_area(grid,e,horiz_lines,vert_lines);





