%% In this program, we will remove the unnecessary details from images.

clear; close all; clc

%% For Normal Images
% Reading Images for Normal Category and saving all of them in a single
% folder after resizing.
dir_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2\train\normal';
dir_save_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2_Enhanced\train\normal';
% 
% Reading all the images from the directory
img_names = dir([dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Normal Images'])
for ind = 1:length(img_names)
    disp(strcat('Processing... ', img_names(ind).name))
    image = imread(fullfile(dir_path, img_names(ind).name));
    image = imresize(image,[256,256]);
    [J,~,~] = entropy_enhancement(image);
    if isempty(J)
        disp('skipped.................')
        continue
    end
    save_path = fullfile(dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
end

clear;
%% For Mild
dir_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2\train\mild';
dir_save_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2_Enhanced\train\mild';
% Reading all the images from the directory
img_names = dir([dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Mild Images'])
for ind = 1:length(img_names)
    disp(strcat('Mild Processed Image: ', img_names(ind).name))
    image = imread(fullfile(dir_path, img_names(ind).name));
    image = imresize(image,[256,256]);
    [J,~,~] = entropy_enhancement(image);
    if isempty(J)
        disp('skipped.................')
        continue
    end
    save_path = fullfile(dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    
end

clear;
%% For Moderate
dir_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2\train\moderate';
dir_save_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2_Enhanced\train\moderate';
% Reading all the images from the directory
img_names = dir([dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Moderate Images'])
for ind = 1:length(img_names)
    disp(strcat('Moderate Processed Image: ', img_names(ind).name))
    image = imread(fullfile(dir_path, img_names(ind).name));
    image = imresize(image,[256,256]);
    [J,~,~] = entropy_enhancement(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
end

clear;
% For PDR
dir_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2\train\pdr';
dir_save_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2_Enhanced\train\pdr';
% Reading all the images from the directory
img_names = dir([dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' PDR Images'])
for ind = 1:length(img_names)
    disp(strcat('PDR Processed Image: ', img_names(ind).name))
    image = imread(fullfile(dir_path, img_names(ind).name));
    image = imresize(image,[256,256]);
    [J,~,~] = entropy_enhancement(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    
end

clear;
%% For Severe
dir_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2\train\severe';
dir_save_path = 'C:\Users\Babar Ali\Desktop\DR_datasets\New_MESSIDOR2_Enhanced\train\severe';
% Reading all the images from the directory
img_names = dir([dir_path, '/*.png']);
disp(['There are ', num2str(length(img_names)),' Severe Images'])
for ind = 1:length(img_names)
    disp(strcat('Severe Processed Image: ', img_names(ind).name))
    image = imread(fullfile(dir_path, img_names(ind).name));
    image = imresize(image,[256,256]);
    [J,~,~] = entropy_enhancement(image);
    if isempty(J)
        continue
    end
    save_path = fullfile(dir_save_path, img_names(ind).name);
    imwrite(J, save_path)
    
end

