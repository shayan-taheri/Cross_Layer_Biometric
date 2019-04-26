% AES Script

clear all; close all; clc;

% cipher_hex = {'??' '??' '??' '??' '??' '??' '??' '??'...
%    '??' '??' '??' '??' '??' '??' '??' '??'};

 cipher_hex = {'05' '45' 'aa' 'd5' '6d' 'a2' 'a9' '7c'...
    '36' '63' 'd1' '43' '2a' '3d' '1c' '84'};

cipher_dec = hex2dec(cipher_hex);

key_hex = {'00' '00' '00' '00' '00' '00' '00' '00'...
    '00' '00' '00' '00' '00' '00' '00' '01'};

key = hex2dec(key_hex);

state = aesinit(key);

% ------------------------------------------------------------------------
% ECB Test of AES-128

plain_dec = aes(state,'dec','ecb',cipher_dec);

plain_hex = dec2hex(plain_dec);

plain_row = plain_hex';

% ------------------------------------------------------------------------
