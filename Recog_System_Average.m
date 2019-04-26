% Written by Shayan Taheri
% The recognition system implementation

% N = The number of data samples

% TN: true_acpt = The number of correctly accepted data samples
% FN: false_acpt = The number of wrongly accepted data samples
% TP: true_rjkt = The number of correctly rejected data samples
% FP: false_rjkt = The number of wrongly rejected data samples

% True Positive Rate (TPR) = TP / (TP + FN) --> or TP / N
% True Negative Rate (TNR) = TN / (TN + FP) --> or TN / N
% False Positive Rate (FPR) = FP / (FP + TN) --> or FP / N
% False Negative Rate (FNR) = FN / (TP + FP) --> or FN / N

% True Positive = Correctly rejection of data sample
% False Positive = Wrongly rejection of data sample
% True Negative = Correctly acceptance of data sample
% False Negative = Wrongly acceptance of data sample

clear all; close all; clc;

% Considering the tolerance boundaries: 1%, 5%, 10%, 20% variations
TH_PCT = 5; % Percentage Range of Threshold Value

true_acpt = 0;
false_acpt = 0;
true_rjkt = 0;
false_rjkt = 0;

% Adding the dataset path
addpath('C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Dataset A');
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Dataset A';

% Read the reference data sample
% Reference Values are in the reference statistic vector
filename_ref = [Path,'\','1_DA_Ref.png'];
img_ref = imread(filename_ref);

stat_ref = imstat(filename_ref);

% Read the test data
img_files = dir([Path '/*.png']);

N = length(img_files);

for iz=1:length(img_files)
 
 skip = 0; % The skip command for the reference data sample
 if ((strcmp(img_files(iz).name(end-6:end-4),'Ref')) && (strcmp(img_files(iz).name(end-9:end-8),'DA')))
  skip = 1; % The reference data is acquired --> Go to the next iteration.
 end
 
 if (skip ~= 1)
  filename_test = img_files(iz).name;
  img_test = imread(filename_test);
  
  Wrong_flag = 0; % Flag for Wrong Data Sample
  if (strcmp(filename_test(end-6:end-4),'Trj'))
   Wrong_flag = 1;
  end
  if (strcmp(filename_test(end-9:end-10),'DB'))
   Wrong_flag = 1;
  end
 
  % Part E of System
  stat_test = imstat(filename_test);

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
  if (stat_acpt_count < 8)
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
   img_dist = zeros(1,5);
   % Part G: Techniques for Data Samples Comparison
   img_dist(1) = min(min(pdist2(double(img_filt),double(img_ref),'euclidean')));
   img_dist(2) = min(min(pdist2(double(img_filt),double(img_ref),'cityblock')));
   img_dist(3) = min(min(pdist2(double(img_filt),double(img_ref),'hamming')));
   img_dist(4) = min(min(pdist2(double(img_filt),double(img_ref),'chebychev')));
   img_dist(5) = min(min(pdist2(double(img_filt),double(img_ref),'correlation')));
   
   img_dist_acpt_count = 0; % Number of Accepted Measures
   
   for it = 1:length(img_dist)
    TH_High = img_dist(it) + TH_PCT*img_dist(it)/100;
    TH_Low = img_dist(it) - TH_PCT*img_dist(it)/100;
    
    if ((img_dist(it) <= TH_High) && (img_dist(it) >= TH_Low))
     img_dist_acpt_count = img_dist_acpt_count + 1; % Acceptance
    end
   end
   
   % If 3 out of 5 statistical measures are accepted --> Acceptance!
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

TN = true_acpt;
FN = false_acpt;
TP = true_rjkt;
FP = false_rjkt;

TPR = TP / (TP + FN);
TNR = TN / (TN + FP);
FPR = FP / (FP + TN);
FNR = FN / (TP + FP);

% FNR --> Wrongly accepted data samples --> The most sensitive part
Security_Metrics = [TPR,TNR,FPR,FNR]
