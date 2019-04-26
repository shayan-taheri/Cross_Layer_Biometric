% Text to Image Conversion
clc; close all; clear all;
% % Open the txt file
fid = fopen('C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Cipher_To_Plain\Hex_Enc.txt', 'r');
% Scann the txt file 
data = fscanf(fid, '%c', [1 inf]);
% Close the txt file
fclose(fid);

% Find all the "\n" from the HEX number
nl_index = strfind(data,sprintf('\n'));
data(nl_index) = [];

emp_ind = 33:33:length(data);
data(emp_ind) = [];

key_hex = {'00' '00' '00' '00' '00' '00' '00' '00'...
    '00' '00' '00' '00' '00' '00' '00' '01'};

key = hex2dec(key_hex);

state = aesinit(key);

% New txt file creation for Verilog Test Bench
fid = fopen('C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Cipher_To_Plain\Hex_Dec.txt', 'wt');
for j = 1:32:length(data)
    
    cipher_hex = {data(j:j+1),data(j+2:j+3),data(j+4:j+5),data(j+6:j+7), ...
        data(j+8:j+9),data(j+10:j+11),data(j+12:j+13),data(j+14:j+15), ...
        data(j+16:j+17),data(j+18:j+19),data(j+20:j+21),data(j+22:j+23), ...
        data(j+24:j+25),data(j+26:j+27),data(j+28:j+29),data(j+30:j+31)};
    
    cipher_dec = hex2dec(cipher_hex);
    
    plain_dec = aes(state,'dec','ecb',cipher_dec);

    for q = 1:length(plain_dec)
        if (plain_dec(q) <= 15)
            plain_hex(q,:) = ['0',dec2hex(plain_dec(q))];
        else
            plain_hex(q,:) = dec2hex(plain_dec(q));
        end
    end
    
    for i = 1:4
        fprintf(fid,'%c%c',plain_hex(i,:));
    end
    
    fprintf(fid,'_');
    
    for i = 5:8
        fprintf(fid,'%c%c',plain_hex(i,:));
    end
    
    fprintf(fid,'_');
    
    for i = 9:12
        fprintf(fid,'%c%c',plain_hex(i,:));
    end
    
    fprintf(fid,'_');
    
    for i = 13:16
        fprintf(fid,'%c%c',plain_hex(i,:));
    end
    
    fprintf(fid,'\n');
end
% Close the txt file
fclose(fid);
