%% Written by Shayan Taheri
%% The Main Code
clear all; close all; clc;

Path_Fing = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Fingerprint';
Path_Iris = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Iris';
Path_Case1_Fing = 'C:\Users\shaya\Desktop\Infection Cases\Case 1\Fingerprint';
Path_Case2_Fing = 'C:\Users\shaya\Desktop\Infection Cases\Case 2\Fingerprint';
Path_Case1_Iris = 'C:\Users\shaya\Desktop\Infection Cases\Case 1\Iris';
Path_Case2_Iris = 'C:\Users\shaya\Desktop\Infection Cases\Case 2\Iris';

addpath(Path_Fing);
addpath(Path_Iris);

addpath(Path_Case1_Fing);
addpath(Path_Case2_Fing);

addpath(Path_Case1_Iris);
addpath(Path_Case2_Iris);

set_dir = dir(Path_Fing);
