%% Written by Shayan Taheri
% The recognition system implementation for "Fingerprint" (RIGHT THUMB)
%% N = The number of data samples

% TP: true_acpt = The number of correctly accepted data samples
% TN: true_rjkt = The number of correctly rejected data samples
% FP: false_rjkt = The number of wrongly rejected data samples
% FN: false_acpt = The number of wrongly accepted data samples

% True Positive = Correctly acceptance of data sample
% True Negative = Correctly rejection of data sample
% False Positive = Wrongly rejection of data sample
% False Negative = Wrongly acceptance of data sample

%% Initialization

tic % Program Start

clear all; close all; clc;

% Adding the path of the "imstat.m" script
addpath('C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System');

% Considering the tolerance boundaries: 5%, 7.5%, 10%, 12.5%, 15%, 17.5%, 20% variations
TH_PCT = 10 % Percentage Value of Threshold Range

true_acpt = 0;
false_acpt = 0;
true_rjkt = 0;
false_rjkt = 0;

% Adding the dataset path
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Fingerprint';
addpath(Path);
cd(Path);
p_dirs = dir(Path);

%% Getting the reference data sample
for ix=3:length(p_dirs)
    
    cd([Path,'\',p_dirs(ix).name,'\R']);
    IR_dir = dir([Path,'\',p_dirs(ix).name,'\R']);
    filename_ref = IR_dir(3).name; % The first image in each dataset
    img_ref = imread(filename_ref);
    stat_ref = imstat(filename_ref);
    close(figure(1));

    %% The Testing Procedure
    for ir=3:length(p_dirs)

        cd(Path);
        cd([Path,'\',p_dirs(ir).name,'\R']);
        % Read the test data sample
        img_files = dir([Path,'\',p_dirs(ir).name,'\R','\*.bmp']);

        for iz=1:length(img_files)

         skip = 0; % The skip command for the reference data sample
         % OLD!: if ((strcmp(img_files(iz).name(end-6:end-4),'Ref')) && (strcmp(img_files(iz).name(end-10:end-8),p_dirs(ix).name)))
         if (strcmp(img_files(iz).name(end-6:end-4),'Ref'))
          skip = 1; % The reference data is acquired --> Go to the next iteration.
         end

         if (skip ~= 1)
          filename_test = img_files(iz).name;
          img_test = imread(filename_test);

          Wrong_flag = 0; % Flag for Wrong Data Sample
          if (strcmp(filename_test(end-6:end-4),'Trj'))
           Wrong_flag = 1;
          end
          if (strcmp(filename_test(end-10:end-8),p_dirs(ix).name) == 0)
           Wrong_flag = 1;
          end

          % Part E of System
          stat_test = imstat(filename_test);
          close(figure(1));

          stat_acpt_count = 0; % Number of Accepted Measures

          for iq = 1:length(stat_ref)

           TH_High = stat_ref(iq) + TH_PCT*stat_ref(iq)/100;
           TH_Low = stat_ref(iq) - TH_PCT*stat_ref(iq)/100;

           if ((stat_test(iq) <= TH_High) && (stat_test(iq) >= TH_Low))
            stat_acpt_count = stat_acpt_count + 1; % Acceptance
           end

          end
          next_stage = 0;
          % If 8 out of 12 statistical measures are accepted --> Acceptance!
          if (stat_acpt_count < 9)
           if (Wrong_flag == 1)
             true_rjkt = true_rjkt + 1;
           else
             false_rjkt = false_rjkt + 1;
           end
          else
             next_stage = 1;
          end
          if (next_stage == 1)
           % Part F: Filtering the Data Sample
           filt = fspecial(('average'),3);
           img_filt = imfilter(img_test,filt);
           img_dist = zeros(1,4);
           % Part G: Techniques for Data Samples Comparison
           img_dist(1) = mean(mean(pdist2(double(img_filt),double(img_ref),'euclidean')));
           img_dist(2) = mean(mean(pdist2(double(img_filt),double(img_ref),'cityblock')));
           img_dist(3) = mean(mean(pdist2(double(img_filt),double(img_ref),'hamming')));
           img_dist(4) = mean(mean(pdist2(double(img_filt),double(img_ref),'chebychev')));

           img_dist_acpt_count = 0; % Number of Accepted Measures

           for it = 1:length(img_dist)
            TH_High = img_dist(it) + TH_PCT*img_dist(it)/100;
            TH_Low = img_dist(it) - TH_PCT*img_dist(it)/100;

            if ((img_dist(it) <= TH_High) && (img_dist(it) >= TH_Low))
             img_dist_acpt_count = img_dist_acpt_count + 1; % Acceptance
            end
           end

           % If 3 out of 4 statistical measures are accepted --> Acceptance!
           if (img_dist_acpt_count < 3)
            if (Wrong_flag == 1)
             true_rjkt = true_rjkt + 1;
            else
             false_rjkt = false_rjkt + 1;
            end
           else
            if (Wrong_flag == 1)
             false_acpt = false_acpt + 1;
            else
             true_acpt = true_acpt + 1;
            end
           end

          end

         end

        end

    end
    
end
%% Performance Evaluation
TP = true_acpt;
TN = true_rjkt;
FP = false_rjkt;
FN = false_acpt;

% TP: true_acpt = The number of correctly accepted data samples
% TN: true_rjkt = The number of correctly rejected data samples
% FP: false_rjkt = The number of wrongly rejected data samples
% FN: false_acpt = The number of wrongly accepted data samples

TPR = TP / (4*50); % Divided by the number of true images
TNR = TN / ((250 - 4)*50); % Divided by the number of false images
FPR = 1 - TNR;
FNR = 1 - TPR;

% FNR --> Wrongly accepted data samples --> The most sensitive part
Security_Metrics = [TPR,TNR,FPR,FNR]

toc % Program End

