# DiabeticRetinoPathyDetection
This repository contains the code and details of our project for diabetic retinopathy detection using deep learning architectures.

<hr/>

## How to Implement Our Code on Your Dataset
1. Firstly, you have to apply the pre-processing steps to make the subtle features visible and conspicuous. The mathematical and other required details are mentioned in the research article; however, just for the sake of implementation, you can use [MATLAB_Related_Files](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files) to get enahanced images. If every thing goes well, you will get images like the ones shown below.

<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/MATLAB_Related_Files/origina_highlighted.png" />
</p>


**Please note that** the pre-processing involves thress steps: i) removing all the [unnecessary information](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/UnnecessayDetailRemoval), ii) applying the [entropy enhancement](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/Entropy_Enhancemnet) technique to increase the imperceptibility of images, and finally iii) [splitting the data](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/Test_Val_Train_Split) set into train, test, and validation sets.

<hr/>

3. When your data is ready, just use the proposed hybrid neural network model, by running the [Main_Program_For_Training_and_Testing.ipynb](https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/Main_Program_For_Training_and_Testing.ipynb) program. Pleaes save the [utilites folder](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/utilities) in the directory where your data and main file is stored. 


<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/model_synopsis.png" />
</p>

<hr/>

4. If your training goes well - the details of our training parameters and other settings is discussed in the article - you will get results like the ones shown below.

<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/results.png" />
</p>
<hr/>
