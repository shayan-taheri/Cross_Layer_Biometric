% Text to Image Conversion
clc; close all; clear all;
% % Open the txt file
fid = fopen('Hex_Data.txt', 'r');
% Scann the txt file 
img = fscanf(fid, '%c', [1 inf]);
% Close the txt file
fclose(fid);
% Find all the "_" and "\n" from the HEX number
j = 1;
us_index = zeros(1,2048*3);
for i = 1:1:length(img)
    if (img(i) == '_')
        us_index(j) = i;
        j=j+1;
    end
end
% Remove all the extra characters
img(us_index) = [];
nl_index = strfind(img,sprintf('\n'));
img(nl_index) = [];

emp_ind = 33:33:length(img);
img(emp_ind) = [];
% Every two HEX numbers should make a decimal number
k = 2;
z = 1;
img_dec = zeros(1,length(img)/2);
while k <= length(img)
     img_dec(z) = hex2dec(img(k-1:k));
     k = k + 2;
     z = z + 1;
end
% Restore the image
outImg = reshape(img_dec,[256 256]);
outImg = outImg';
figure();
imshow(outImg,[]);
fimg=getframe;
imgData = fimg.cdata;
imwrite(imgData(1:256,1:256,:),'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Hex_Image (for Software Analysis)\ImageName.bmp');
