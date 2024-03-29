<h1 align="center" >
    A Unified Technique for Entropy Enhancement Based Diabetic Retinopathy Detection Using Hybrid Neural Network
</h1>

This repository contains the code and details of our research article **_"[A Unified Technique for Entropy Enhancement Based Diabetic Retinopathy Detection Using Hybrid Neural Network](https://www.sciencedirect.com/science/article/abs/pii/S0010482522002165?via%3Dihub),"_** accepted for publication in the **_[Computers in Biology and Medicine Journal](https://www.journals.elsevier.com/computers-in-biology-and-medicine)_**.

<hr/>

## How to Implement Our Code on Your Dataset
1. Firstly, you have to apply the pre-processing steps to make the subtle features visible and conspicuous. The mathematical and other required details are mentioned in the [research article](https://www.sciencedirect.com/science/article/abs/pii/S0010482522002165?via%3Dihub); however, just for the sake of implementation, you can use [MATLAB_Related_Files](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files) to get enahanced images. If every thing goes well, you will get images like the ones shown below.

<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/MATLAB_Related_Files/origina_highlighted.png" />
</p>


**Please note that** the pre-processing involves thress steps: i) removing all the [unnecessary information](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/UnnecessayDetailRemoval), ii) applying the [entropy enhancement](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/Entropy_Enhancemnet) technique to increase the imperceptibility of images, and finally iii) [splitting the data](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/MATLAB_Related_Files/Test_Val_Train_Split) set into train, test, and validation sets.

<hr/>

2. When your data is ready, just use the proposed hybrid neural network model, by running the [Main_Program.ipynb](https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/Main_Program_For_Training_and_Testing.ipynb) program. Pleaes save the [utilites folder](https://github.com/ImranNust/DiabeticRetinoPathyDetection/tree/main/utilities) in the directory where your data and main file is stored. 


<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/model_synopsis.png" />
</p>

<hr/>

3. If your training goes well - the details of our training parameters and other settings are discussed in the [research article](https://www.sciencedirect.com/science/article/abs/pii/S0010482522002165?via%3Dihub) - you will get results like the ones shown below. **Please note that the following results are for the [APTOS dataset](https://www.kaggle.com/c/aptos2019-blindness-detection)**. In addition to that, we also used [MESSIDOR-2](https://www.adcis.net/en/third-party/messidor2/) and [UWF](https://www.nature.com/articles/s41598-021-81539-3) datasets in our [paper](https://authors.elsevier.com/a/1ep0-2OYd01Br). 

<p align="center">
  <img src="https://github.com/ImranNust/DiabeticRetinoPathyDetection/blob/main/results.png" />
</p>

<hr/>

If you find our [paper](https://authors.elsevier.com/a/1ep0-2OYd01Br) or [code](https://github.com/ImranNust/DiabeticRetinoPathyDetection) useful, please cite our work as as follows:

**Fatima, [M. Imran](https://github.com/ImranNust), A. Ullah, M. Arif, R. Noor, "[A unified technique for entropy enhancement based diabetic retinopathy detection using hybrid neural network](https://www.sciencedirect.com/science/article/abs/pii/S0010482522002165?via%3Dihub)," _Computers in Biology and Medicine_, vol. 145, June 22, 2022, pp. 105424, ISSN 0010-4825. Doi: https://doi.org/10.1016/j.compbiomed.2022.105424.**

<hr/>
