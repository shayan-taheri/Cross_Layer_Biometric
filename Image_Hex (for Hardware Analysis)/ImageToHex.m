% Image to Text Conversion
clear all; close all; clc;
% Adding the image dataset path
addpath('C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Image_Hex (for Hardware Analysis)\Case2_Fing\True Images');
% Read the image from the file
% An image with any format is given
% uigetfile: Open file selection dialog box
[filename, pathname] = uigetfile('*.bmp;*.tif;*.jpg;*.pgm;*.png','Pick an M-file');
img = imread(filename);
img = imresize((img),[256 256]);
[row,col,p] = size(img);

% The dimension of the image
if p == 3
    img = rgb2gray(img);
end

% Image Transpose
imgTrans = img';
% iD conversion
img1D = imgTrans(:);
% Decimal to Hex value conversion
imgHex = dec2hex(img1D);
% New txt file creation
fid = fopen('ImageHex.txt', 'wt');
% Hex value write to the txt file
for j = 1:16:size(imgHex,1)
    for i = 1:4
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'_');
    for i = 5:8
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'_');
    for i = 9:12
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'_');
    for i = 13:16
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'\n');
end
% Close the txt file
fclose(fid);

% New txt file creation for Verilog Test Bench
fid = fopen('ImageHex_Verilog.txt', 'wt');
for j = 1:16:size(imgHex,1)
    
    if (j >= 2)
        fprintf(fid,'#500;');
        fprintf(fid,'\n');
        fprintf(fid,'$fwrite(fileX,"');
        fprintf(fid,'%%');
        fprintf(fid,'h\\');
        fprintf(fid,'n",out);');
        fprintf(fid,'\n');
    end
    
    
    fprintf(fid,'state = 128''h');
    
    for i = 1:4
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'_');
    for i = 5:8
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'_');
    for i = 9:12
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    fprintf(fid,'_');
    for i = 13:16
        fprintf(fid,'%c%c',imgHex(i+j-1,:));
    end
    
    fprintf(fid,';');
    fprintf(fid,'\n');
    fprintf(fid,'key   = 128''h1;');
    fprintf(fid,'\n');
    fprintf(fid,'\n');
end
% Close the txt file
fclose(fid);