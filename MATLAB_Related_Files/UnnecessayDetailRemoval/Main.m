%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% First, we will remove borders from all images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc

%% For Normal Images

% Plesae give path where the images are stored
train_dir_path = 'C:\DR_datasets\APTOSS\train\normal';

% Please give path where you want to store the processed data
train_dir_save_path = 'C:\\DR_datasets\New_APTOSS\train\normal';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% For Normal Images
img_names = dir([train_dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Normal Images in the Training Directory'])
for ind = 1:length(img_names)
    image = imread(fullfile(train_dir_path, img_names(ind).name));
    J = Removing_Boarders(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(train_dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    disp(strcat('Normal Train Processed Image: ', num2str(ind)))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close; clc
%% For Mild Images

train_dir_path = 'C:\DR_datasets\APTOSS\train\mild';
train_dir_save_path = 'C:\DR_datasets\New_APTOSS\train\mild';


% For Train Images
img_names = dir([train_dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' mild Images in the Training Directory'])
for ind = 1:length(img_names)
    image = imread(fullfile(train_dir_path, img_names(ind).name));
    J = Removing_Boarders(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(train_dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    disp(strcat('mild Train Processed Image: ', num2str(ind)))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close; clc
%% For moderate Images

train_dir_path = 'C:\DR_datasets\APTOSS\train\moderate';
train_dir_save_path = 'C:\DR_datasets\New_APTOSS\train\moderate';


% For Train Images
img_names = dir([train_dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' moderate Images in the Training Directory'])
for ind = 1:length(img_names)
    image = imread(fullfile(train_dir_path, img_names(ind).name));
    J = Removing_Boarders(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(train_dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    disp(strcat('moderate Train Processed Image: ', num2str(ind)))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close; clc
%% For severe Images

train_dir_path = 'C:\DR_datasets\APTOSS\train\severe';
train_dir_save_path = 'C:\DR_datasets\New_APTOSS\train\severe';


% For Train Images
img_names = dir([train_dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' severe Images in the Training Directory'])
for ind = 1:length(img_names)
    image = imread(fullfile(train_dir_path, img_names(ind).name));
    J = Removing_Boarders(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(train_dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    disp(strcat('severe Train Processed Image: ', num2str(ind)))
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close; clc
%% For PDR Images

train_dir_path = 'C:\DR_datasets\APTOSS\train\pdr';

train_dir_save_path = 'C:\DR_datasets\New_APTOSS\train\pdr';


% For Train Images
img_names = dir([train_dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' pdr Images in the Training Directory'])
for ind = 1:length(img_names)
    image = imread(fullfile(train_dir_path, img_names(ind).name));
    J = Removing_Boarders(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(train_dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    disp(strcat('pdr Train Processed Image: ', num2str(ind)))
end


