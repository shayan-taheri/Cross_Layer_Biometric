% Written by Shayan Taheri
%% Read and Rename the Folders in Iris Dataset
clear all; close all; clc;
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Iris';
cd(Path);
addpath(Path);
set_dir = dir(Path);
N = length(set_dir);
for iz=3:N % The first two elements are extra
    dir_name = set_dir(iz).name;
    if ((iz - 2) <= 9)
        movefile(dir_name,['P',num2str(0),num2str(iz-2)]);
    else
        movefile(dir_name,['P',num2str(iz-2)]);
    end
end
% -------------------------------------------------------------------------------------------------------------------------------
clear all; close all; clc;
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Iris';
cd(Path);
addpath(Path);
set_dir = dir(Path);
N = length(set_dir);
for iz=3:N % The first two elements are extra
    dir_name = set_dir(iz).name;
    set_dirL = dir([dir_name,'\L']);
    set_dirR = dir([dir_name,'\R']);
    if ((length(set_dirL) < 7) || (length(set_dirR) < 7))
        fprintf([dir_name,',']);
    end
end
fprintf('\n');
% -------------------------------------------------------------------------------------------------------------------------------
clear all; close all; clc;
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Iris';
cd(Path);
addpath(Path);
set_dir = dir(Path);
N = length(set_dir);
for iz=3:N % The first two elements are extra
    cd(Path);
    dir_name = set_dir(iz).name;
    set_dirL = dir([dir_name,'\L']);
    cd([dir_name,'\L']);
    for jz=3:length(set_dirL)
     dir_im = set_dirL(jz).name;
     if (jz <= 7)
      if ((jz - 2) == 1)
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Ref','.jpg']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Ref','.jpg']);
          end
      else
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Tst','.jpg']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Tst','.jpg']);
          end
      end
     else
       delete(dir_im);
     end
    end
    cd(Path);
    set_dirR = dir([dir_name,'\R']);
    cd([dir_name,'\R']);
    for jz=3:length(set_dirR)
     dir_im = set_dirR(jz).name;
     if (jz <= 7)
      if ((jz - 2) == 1)
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Ref','.jpg']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Ref','.jpg']);
          end
      else
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Tst','.jpg']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Tst','.jpg']);
          end
      end
     else
       delete(dir_im);
     end
    end
end

%% Read and Rename the Folders in Fingerprint Dataset
clear all; close all; clc;
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Fingerprint';
cd(Path);
addpath(Path);
set_dir = dir(Path);
N = length(set_dir);
for iz=3:N % The first two elements are extra
    dir_name = set_dir(iz).name;
    if ((iz - 2) <= 9)
        movefile(dir_name,['P',num2str(0),num2str(iz-2)]);
    else
        movefile(dir_name,['P',num2str(iz-2)]);
    end
end
% -------------------------------------------------------------------------------------------------------------------------------
clear all; close all; clc;
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Fingerprint';
cd(Path);
addpath(Path);
set_dir = dir(Path);
N = length(set_dir);
for iz=3:N % The first two elements are extra
    dir_name = set_dir(iz).name;
    set_dirL = dir([dir_name,'\L']);
    set_dirR = dir([dir_name,'\R']);
    if ((length(set_dirL) < 7) || (length(set_dirR) < 7))
        fprintf([dir_name,',']);
    end
end
fprintf('\n');
% -------------------------------------------------------------------------------------------------------------------------------
clear all; close all; clc;
Path = 'C:\Users\shaya\Desktop\Recognition Hardware Security\Recognition System Modules\Recognition System\Chosen Dataset\Fingerprint';
cd(Path);
addpath(Path);
set_dir = dir(Path);
N = length(set_dir);
for iz=3:N % The first two elements are extra
    cd(Path);
    dir_name = set_dir(iz).name;
    set_dirL = dir([dir_name,'\L']);
    cd([dir_name,'\L']);
    for jz=3:length(set_dirL)
     dir_im = set_dirL(jz).name;
     if (jz <= 7)
      if ((jz - 2) == 1)
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Ref','.bmp']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Ref','.bmp']);
          end
      else
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Tst','.bmp']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Tst','.bmp']);
          end
      end
     else
       delete(dir_im);
     end
    end
    cd(Path);
    set_dirR = dir([dir_name,'\R']);
    cd([dir_name,'\R']);
    for jz=3:length(set_dirR)
     dir_im = set_dirR(jz).name;
     if (jz <= 7)
      if ((jz - 2) == 1)
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Ref','.bmp']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Ref','.bmp']);
          end
      else
          if ((iz-2) <= 9)
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(0),num2str(iz-2),'_Tst','.bmp']);
          else
           movefile(dir_im,['I',num2str(jz-2),'_','P',num2str(iz-2),'_Tst','.bmp']);
          end
      end
     else
       delete(dir_im);
     end
    end
end
