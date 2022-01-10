

clear ; close all; clc

%% For Normal Images in  APTOSS Folder
% Out of total normal images, so we will reserve 10% images for testing and 10% images for validation



train_normal_path = 'C:\DR_datasets\APTOSS\train\normal';
test_normal_path = 'C:\DR_datasets\APTOSS\test\normal';
val_normal_path = 'C:\DR_datasets\APTOSS\validation\normal';
% Reading all the images from the directory
img_names = dir([train_normal_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Normal images'])

% For Test Folder
rand_img_no = randperm( round(length(img_names)*10/100)*2);
increament = 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
for ind = 1:length(rand_img_no)/2
    test_image_path = fullfile(train_normal_path, img_names(rand_img_no(increament)).name);
    movefile(test_image_path, test_normal_path)
    increament = increament + 1;
    val_image_path = fullfile(train_normal_path, img_names(rand_img_no(increament)).name);
    movefile(val_image_path, val_normal_path)
    increament = increament + 1;
    disp(strcat('normal processed image: ', num2str(ind)))
end


%% For Mild Images in  APTOSS Folder
% % Out of total mild images, we will reserve 10% images for testing and 10% images for validation



train_mild_path = 'C:\DR_datasets\APTOSS\train\mild';
test_mild_path = 'C:\DR_datasets\APTOSS\test\mild';
val_mild_path = 'C:\DR_datasets\APTOSS\validation\mild';
% Reading all the images from the directory
img_names = dir([train_mild_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Mild images'])

% For Test Folder
rand_img_no = randperm( round(length(img_names)*10/100)*2);
increament = 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
for ind = 1:length(rand_img_no)/2
    test_image_path = fullfile(train_mild_path, img_names(rand_img_no(increament)).name);
    movefile(test_image_path, test_mild_path)
    increament = increament + 1;
    val_image_path = fullfile(train_mild_path, img_names(rand_img_no(increament)).name);
    movefile(val_image_path, val_mild_path)
    increament = increament + 1;
    disp(strcat('mild processed image: ', num2str(ind)))
end

%% For Moderate Images in  APTOSS Folder
% Out of total moderate images, we will reserve 10% images for testing and 10% images for validation



train_moderate_path = 'C:\DR_datasets\APTOSS\train\moderate';
test_moderate_path = 'C:\DR_datasets\APTOSS\test\moderate';
val_moderate_path = 'C:\DR_datasets\APTOSS\validation\moderate';
% Reading all the images from the directory
img_names = dir([train_moderate_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Moderate images'])

% For Test Folder
rand_img_no = randperm( round(length(img_names)*10/100)*2);
increament = 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
for ind = 1:length(rand_img_no)/2
    test_image_path = fullfile(train_moderate_path, img_names(rand_img_no(increament)).name);
    movefile(test_image_path, test_moderate_path)
    increament = increament + 1;
    val_image_path = fullfile(train_moderate_path, img_names(rand_img_no(increament)).name);
    movefile(val_image_path, val_moderate_path)
    increament = increament + 1;
    disp(strcat('moderate processed image: ', num2str(ind)))
end


%% For Severe Images in  APTOSS Folder
% Out of total severe images, so we will reserve 10% images for testing and 10% images for validation


train_severe_path = 'C:\DR_datasets\APTOSS\train\severe';
test_severe_path = 'C:\DR_datasets\APTOSS\test\severe';
val_severe_path = 'C:\DR_datasets\APTOSS\validation\severe';
% Reading all the images from the directory
img_names = dir([train_severe_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Severe images'])

% For Test Folder
rand_img_no = randperm( round(length(img_names)*10/100)*2);
increament = 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
for ind = 1:length(rand_img_no)/2
    test_image_path = fullfile(train_severe_path, img_names(rand_img_no(increament)).name);
    movefile(test_image_path, test_severe_path)
    increament = increament + 1;
    val_image_path = fullfile(train_severe_path, img_names(rand_img_no(increament)).name);
    movefile(val_image_path, val_severe_path)
    increament = increament + 1;
    disp(strcat('severe processed image: ', num2str(ind)))
end

%% For PDR Images in  APTOSS Folder
% Out of total PDR images, so we will reserve 10% images for testing and 10% images for validation



train_pdr_path = 'C:\DR_datasets\APTOSS\train\pdr';
test_pdr_path = 'C:\DR_datasets\APTOSS\test\pdr';
val_pdr_path = 'C:\DR_datasets\APTOSS\validation\pdr';
% Reading all the images from the directory
img_names = dir([train_pdr_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' PDR images'])

% For Test Folder
rand_img_no = randperm( round(length(img_names)*10/100)*2);
increament = 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
for ind = 1:length(rand_img_no)/2
    test_image_path = fullfile(train_pdr_path, img_names(rand_img_no(increament)).name);
    movefile(test_image_path, test_pdr_path)  
    increament = increament + 1;
    val_image_path = fullfile(train_pdr_path, img_names(rand_img_no(increament)).name);
    movefile(val_image_path, val_pdr_path)
    increament = increament + 1;
    disp(strcat('pdr processed image: ', num2str(ind)))
end