# DiabeticRetinoPathyDetection
This repository contains the code and details of our project for diabetic retinopathy detection using deep learning architectures.

## How to Implement Our Code on Your Dataset
1. Firstly, you have to apply the pre-processing steps to make the subtle features visible and conspicuous. The mathematical and other required details are mentioned in the research article; however, just for the sake of implementation, you can use [MATLAB_Related_Files](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files) to get enahanced images. If every thing goes well, you will get images like the one shown below.

<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/MATLAB_Related_Files/origina_highlighted.png" />
</p>

2. The pre-processing steps must be divided into thress steps: 

  i) removing all the [unnecessary information](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/UnnecessayDetailRemoval), 
  
  ii) apply [entropy enhancement](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/Entropy_Enhancemnet) technique to increase the imperceptibility of images, and finally 
  
  iii) [splitting the data](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/Test_Val_Train_Split) set into train, test, and validation sets.
