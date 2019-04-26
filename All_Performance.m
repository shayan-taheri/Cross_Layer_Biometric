%% Preparing Environment
clear all; close all; clc;
%% Creating Vectors for Plotting Left Fingerprint

TH_Val = [5,7.5,10,12.5,15,17.5,20];

Left_Thumb_TP1 = [0.2000,0.4300,0.6150,0.7650,0.8400,0.9000,0.9200];
Left_Thumb_TN1 = [0.7453,0.6402,0.5189,0.4117,0.3198,0.2367,0.1759];
Left_Thumb_FP1 = [0.2547,0.3598,0.4811,0.5883,0.6802,0.7633,0.8241];
Left_Thumb_FN1 = [0.8000,0.5700,0.3850,0.2350,0.1600,0.1000,0.0800];

Left_Thumb_TP2 = [0.2053,0.4368,0.6211,0.7684,0.8421,0.9000,0.9211];
Left_Thumb_TN2 = [0.7488,0.6496,0.5340,0.4335,0.3468,0.2669,0.2090];
Left_Thumb_FP2 = [0.2512,0.3504,0.4660,0.5665,0.6532,0.7331,0.7910];
Left_Thumb_FN2 = [0.7947,0.5632,0.3789,0.2316,0.1579,0.1000,0.0789];

Left_Thumb_TP3 = [0.2000,0.4421,0.6158,0.7684,0.8474,0.9053,0.9263];
Left_Thumb_TN3 = [0.7487,0.6494,0.5349,0.4334,0.3458,0.2675,0.2094];
Left_Thumb_FP3 = [0.2513,0.3506,0.4651,0.5666,0.6542,0.7325,0.7906];
Left_Thumb_FN3 = [0.8000,0.5579,0.3842,0.2316,0.1526,0.0947,0.0737];

figure();

subplot(2,2,1);

hold on;
plot(TH_Val,Left_Thumb_TP1,'Color',[0, 0, 1],'Marker','d','LineWidth',1.5);
plot(TH_Val,Left_Thumb_TN1,'Color',[0, 0.5, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Left_Thumb_FP1,'Color',[1, 0, 0],'Marker','s','LineWidth',1.5);
plot(TH_Val,Left_Thumb_FN1,'Color',[0, 0.75, 0.75],'Marker','^','LineWidth',1.5);

plot(TH_Val,Left_Thumb_TP2,'Color',[0.75, 0, 0.75],'Marker','d','LineWidth',1.5);
plot(TH_Val,Left_Thumb_TN2,'Color',[0.75, 0.75, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Left_Thumb_FP2,'Color',[0.25, 0.25, 0.25],'Marker','s','LineWidth',1.5);
plot(TH_Val,Left_Thumb_FN2,'Color',[0, 0.4470, 0.7410],'Marker','^','LineWidth',1.5);

plot(TH_Val,Left_Thumb_TP3,'Color',[0.8500, 0.3250, 0.0980],'Marker','d','LineWidth',1.5);
plot(TH_Val,Left_Thumb_TN3,'Color',[0.4940, 0.1840, 0.5560],'Marker','o','LineWidth',1.5);
plot(TH_Val,Left_Thumb_FP3,'Color',[0.3010, 0.7450, 0.9330],'Marker','s','LineWidth',1.5);
plot(TH_Val,Left_Thumb_FN3,'Color',[0.6350, 0.0780, 0.1840],'Marker','^','LineWidth',1.5);
hold off;

ylabel('System Performance Parameter','FontSize', 12);
xlabel('Threshold Value Percentage','FontSize', 12);
title('Analysis of System Performance for Left Fingerprint','FontSize', 12);
set(gca, 'fontsize', 10);
AX = legend('TP - Genuine Data','TN - Genuine Data','FP - Genuine Data','FN - Genuine Data', ...
    'TP - Infected Data (Case 1)','TN - Infected Data (Case 1)','FP - Infected Data (Case 1)','FN - Infected Data (Case 1)', ...
    'TP - Infected Data (Case 2)','TN - Infected Data (Case 2)','FP - Infected Data (Case 2)','FN - Infected Data (Case 2)');

LEG = findobj(AX,'type','text');
set(LEG,'FontSize',10);

%% Creating Vectors for Plotting Right Fingerprint

TH_Val = [5,7.5,10,12.5,15,17.5,20];

Right_Thumb_TP1 = [0.2200,0.4700,0.6750,0.7900,0.9000,0.9450,0.9700];
Right_Thumb_TN1 = [0.7333,0.6142,0.4747,0.3641,0.2627,0.1876,0.1330];
Right_Thumb_FP1 = [0.2667,0.3858,0.5253,0.6359,0.7373,0.8124,0.8670];
Right_Thumb_FN1 = [0.7800,0.5300,0.3250,0.2100,0.1000,0.0550,0.0300];

Right_Thumb_TP2 = [0.2316,0.4789,0.6789,0.7842,0.9000,0.9474,0.9684];
Right_Thumb_TN2 = [0.7356,0.6203,0.4871,0.3813,0.2862,0.2156,0.1643];
Right_Thumb_FP2 = [0.2644,0.3797,0.5129,0.6187,0.7138,0.7844,0.8357];
Right_Thumb_FN2 = [0.7684,0.5211,0.3211,0.2158,0.1000,0.0526,0.0316];

Right_Thumb_TP3 = [0.2158,0.4632,0.6737,0.7895,0.9053,0.9526,0.9789];
Right_Thumb_TN3 = [0.7354,0.6205,0.4869,0.3820,0.2862,0.2148,0.1635];
Right_Thumb_FP3 = [0.2646,0.3795,0.5131,0.6180,0.7138,0.7852,0.8365];
Right_Thumb_FN3 = [0.7842,0.5368,0.3263,0.2105,0.0947,0.0474,0.0211];

subplot(2,2,2);

hold on;
plot(TH_Val,Right_Thumb_TP1,'Color',[0, 0, 1],'Marker','d','LineWidth',1.5);
plot(TH_Val,Right_Thumb_TN1,'Color',[0, 0.5, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Right_Thumb_FP1,'Color',[1, 0, 0],'Marker','s','LineWidth',1.5);
plot(TH_Val,Right_Thumb_FN1,'Color',[0, 0.75, 0.75],'Marker','^','LineWidth',1.5);

plot(TH_Val,Right_Thumb_TP2,'Color',[0.75, 0, 0.75],'Marker','d','LineWidth',1.5);
plot(TH_Val,Right_Thumb_TN2,'Color',[0.75, 0.75, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Right_Thumb_FP2,'Color',[0.25, 0.25, 0.25],'Marker','s','LineWidth',1.5);
plot(TH_Val,Right_Thumb_FN2,'Color',[0, 0.4470, 0.7410],'Marker','^','LineWidth',1.5);

plot(TH_Val,Right_Thumb_TP3,'Color',[0.8500, 0.3250, 0.0980],'Marker','d','LineWidth',1.5);
plot(TH_Val,Right_Thumb_TN3,'Color',[0.4940, 0.1840, 0.5560],'Marker','o','LineWidth',1.5);
plot(TH_Val,Right_Thumb_FP3,'Color',[0.3010, 0.7450, 0.9330],'Marker','s','LineWidth',1.5);
plot(TH_Val,Right_Thumb_FN3,'Color',[0.6350, 0.0780, 0.1840],'Marker','^','LineWidth',1.5);
hold off;

ylabel('System Performance Parameter','FontSize', 12);
xlabel('Threshold Value Percentage','FontSize', 12);
title('Analysis of System Performance for Right Fingerprint','FontSize', 12);
set(gca, 'fontsize', 10);
AX = legend('TP - Genuine RF','TN - Genuine RF','FP - Genuine RF','FN - Genuine RF', ...
    'TP - Infected RF 1','TN - Infected RF 1','FP - Infected RF 1','FN - Infected RF 1', ...
    'TP - Infected RF 2','TN - Infected RF 2','FP - Infected RF 2','FN - Infected RF 2');

LEG = findobj(AX,'type','text');
set(LEG,'FontSize',10);

%% Creating Vectors for Plotting Left Iris

TH_Val = [5,7.5,10,12.5,15,17.5,20];

Left_Iris_TP1 = [0.6200,0.6850,0.7250,0.7950,0.8350,0.8600,0.9500];
Left_Iris_TN1 = [0.5777,0.5060,0.4515,0.3958,0.3437,0.2745,0.1679];
Left_Iris_FP1 = [0.4223,0.4940,0.5485,0.6042,0.6563,0.7255,0.8321];
Left_Iris_FN1 = [0.3800,0.3150,0.2750,0.2050,0.1650,0.1400,0.0500];

Left_Iris_TP2 = [0.6211,0.6895,0.7263,0.8000,0.8316,0.8579,0.9526];
Left_Iris_TN2 = [0.5877,0.5191,0.4674,0.4129,0.3618,0.2927,0.1886];
Left_Iris_FP2 = [0.4123,0.4809,0.5326,0.5871,0.6382,0.7073,0.8114];
Left_Iris_FN2 = [0.3789,0.3105,0.2737,0.2000,0.1684,0.1421,0.0474];

Left_Iris_TP3 = [0.6316,0.6895,0.7263,0.7842,0.8263,0.8526,0.9474];
Left_Iris_TN3 = [0.5853,0.5168,0.4652,0.4098,0.3604,0.2950,0.1883];
Left_Iris_FP3 = [0.4147,0.4832,0.5348,0.5902,0.6396,0.7050,0.8117];
Left_Iris_FN3 = [0.3684,0.3105,0.2737,0.2158,0.1737,0.1474,0.0526];

subplot(2,2,3);

hold on;
plot(TH_Val,Left_Iris_TP1,'Color',[0, 0, 1],'Marker','d','LineWidth',1.5);
plot(TH_Val,Left_Iris_TN1,'Color',[0, 0.5, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Left_Iris_FP1,'Color',[1, 0, 0],'Marker','s','LineWidth',1.5);
plot(TH_Val,Left_Iris_FN1,'Color',[0, 0.75, 0.75],'Marker','^','LineWidth',1.5);

plot(TH_Val,Left_Iris_TP2,'Color',[0.75, 0, 0.75],'Marker','d','LineWidth',1.5);
plot(TH_Val,Left_Iris_TN2,'Color',[0.75, 0.75, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Left_Iris_FP2,'Color',[0.25, 0.25, 0.25],'Marker','s','LineWidth',1.5);
plot(TH_Val,Left_Iris_FN2,'Color',[0, 0.4470, 0.7410],'Marker','^','LineWidth',1.5);

plot(TH_Val,Left_Iris_TP3,'Color',[0.8500, 0.3250, 0.0980],'Marker','d','LineWidth',1.5);
plot(TH_Val,Left_Iris_TN3,'Color',[0.4940, 0.1840, 0.5560],'Marker','o','LineWidth',1.5);
plot(TH_Val,Left_Iris_FP3,'Color',[0.3010, 0.7450, 0.9330],'Marker','s','LineWidth',1.5);
plot(TH_Val,Left_Iris_FN3,'Color',[0.6350, 0.0780, 0.1840],'Marker','^','LineWidth',1.5);
hold off;

ylabel('System Performance Parameter','FontSize', 12);
xlabel('Threshold Value Percentage','FontSize', 12);
title('Analysis of System Performance for Left Iris','FontSize', 12);
set(gca, 'fontsize', 10);
AX = legend('TP - Genuine LI','TN - Genuine LI','FP - Genuine LI','FN - Genuine LI', ...
    'TP - Infected LI 1','TN - Infected LI 1','FP - Infected LI 1','FN - Infected LI 1', ...
    'TP - Infected LI 2','TN - Infected LI 2','FP - Infected LI 2','FN - Infected LI 2');

LEG = findobj(AX,'type','text');
set(LEG,'FontSize',10);

%% Creating Vectors for Plotting Right Iris

TH_Val = [5,7.5,10,12.5,15,17.5,20];

Right_Iris_TP1 = [0.6450,0.6850,0.7250,0.7850,0.8450,0.8850,0.9250];
Right_Iris_TN1 = [0.5615,0.4898,0.4318,0.3841,0.3371,0.2889,0.2065];
Right_Iris_FP1 = [0.4385,0.5102,0.5682,0.6159,0.6629,0.7111,0.7935];
Right_Iris_FN1 = [0.3550,0.3150,0.2750,0.2150,0.1550,0.1150,0.0750];

Right_Iris_TP2 = [0.6368,0.6789,0.7211,0.7842,0.8474,0.8895,0.9316];
Right_Iris_TN2 = [0.5738,0.5050,0.4489,0.4010,0.3536,0.3044,0.2217];
Right_Iris_FP2 = [0.4262,0.4950,0.5511,0.5990,0.6464,0.6956,0.7783];
Right_Iris_FN2 = [0.3632,0.3211,0.2789,0.2158,0.1526,0.1105,0.0684];

Right_Iris_TP3 = [0.6316,0.6737,0.7158,0.7789,0.8368,0.8789,0.9211];
Right_Iris_TN3 = [0.5740,0.5059,0.4488,0.4020,0.3554,0.3061,0.2250];
Right_Iris_FP3 = [0.4260,0.4941,0.5512,0.5980,0.6446,0.6939,0.7750];
Right_Iris_FN3 = [0.3684,0.3263,0.2842,0.2211,0.1632,0.1211,0.0789];

subplot(2,2,4);

hold on;
plot(TH_Val,Right_Iris_TP1,'Color',[0, 0, 1],'Marker','d','LineWidth',1.5);
plot(TH_Val,Right_Iris_TN1,'Color',[0, 0.5, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Right_Iris_FP1,'Color',[1, 0, 0],'Marker','s','LineWidth',1.5);
plot(TH_Val,Right_Iris_FN1,'Color',[0, 0.75, 0.75],'Marker','^','LineWidth',1.5);

plot(TH_Val,Right_Iris_TP2,'Color',[0.75, 0, 0.75],'Marker','d','LineWidth',1.5);
plot(TH_Val,Right_Iris_TN2,'Color',[0.75, 0.75, 0],'Marker','o','LineWidth',1.5);
plot(TH_Val,Right_Iris_FP2,'Color',[0.25, 0.25, 0.25],'Marker','s','LineWidth',1.5);
plot(TH_Val,Right_Iris_FN2,'Color',[0, 0.4470, 0.7410],'Marker','^','LineWidth',1.5);

plot(TH_Val,Right_Iris_TP3,'Color',[0.8500, 0.3250, 0.0980],'Marker','d','LineWidth',1.5);
plot(TH_Val,Right_Iris_TN3,'Color',[0.4940, 0.1840, 0.5560],'Marker','o','LineWidth',1.5);
plot(TH_Val,Right_Iris_FP3,'Color',[0.3010, 0.7450, 0.9330],'Marker','s','LineWidth',1.5);
plot(TH_Val,Right_Iris_FN3,'Color',[0.6350, 0.0780, 0.1840],'Marker','^','LineWidth',1.5);
hold off;

ylabel('System Performance Parameter','FontSize', 12);
xlabel('Threshold Value Percentage','FontSize', 12);
title('Analysis of System Performance for Right Fingerprint','FontSize', 12);
set(gca, 'fontsize', 10);
AX = legend('TP - Genuine RF','TN - Genuine RF','FP - Genuine RF','FN - Genuine RF', ...
    'TP - Infected RF 1','TN - Infected RF 1','FP - Infected RF 1','FN - Infected RF 1', ...
    'TP - Infected RF 2','TN - Infected RF 2','FP - Infected RF 2','FN - Infected RF 2');

LEG = findobj(AX,'type','text');
set(LEG,'FontSize',10);