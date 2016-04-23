
function[porosity,ssa] = Main(im)

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

% Y=rgb2ycbcr(im);
% %figure,imshow(Y);
% t = graythresh(im);
% %display(t);
% t=140;
% for I=1:s1
%     for J=1:s2
%         if Y(I,J,2)>t
%             BW(I,J)=1;
%         end
%     end
% end


%-------------------------------------------------------
% Thresholding based on RGB values of pixels
%-------------------------------------------------------
% 
for I=1:s1
    for J=1:s2
        if(im(I,J,1)<203 && im(I,J,2)<203 && im(I,J,3)>170)
            BW(I,J)=1;
        end 
    end
end


% Denoising after thresholding
str = strel('octagon',3);
c = imopen(BW,str);
f = imclose(c,str);
sample1 = medfilt2(f);

x = logical(sample1);
figure,imshow(sample1);

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
F=imerode(sample1,str);  % Erode
e = sample1 - F;
figure,imshow(e);

% Creating a Grid for Specific Surface Area
[grid,horiz_lines,vert_lines] = create_grid(e);

%figure,imshowpair(e,grid);

% Calculating Specific Surface Area
[ssa] = specific_area(grid,e,horiz_lines,vert_lines);





