# Imports
import tensorflow as tf
import numpy as np
import os
import matplotlib.pyplot as plt
import matplotlib as mpl

from tensorflow.keras.layers import Conv2D, Activation, BatchNormalization, LayerNormalization, MaxPooling2D
from tensorflow.keras.layers import Input, Flatten, Dense, Dropout, Add, AveragePooling2D, Concatenate
from tensorflow.keras.models import Model
from tensorflow.keras.utils import plot_model, to_categorical

##### CODE FOR MODEL #####################

def CNNBlock(inputs, filters = 16, kernel_size = 3, strides = 1, 
             Normalization = 'layer_normalization'):
    """
    This function will create a CNN block (Conv2D --> BN --> Activation)
    
    Arguments:
    inputs --> This is the input of shape (batch_size, rows, cols, channels)
    filters --> This is the input of number of filters used in the convolution layer.
    kernel_size --> the size of the filter. The default value is 3x3
    strides --. A scalar integer. The default value is 1.
    Normalization --> This input is a string, which will decide the type of normalization,
                      you want to use in your model. The default value is 'layer_normalization'.
                      The other two options are 'batch_normalization' and 'batch_renormalization'.
                      
    Return:
    outputs --> This is the output of the block of shape (batch_size, rows, cols, filters)
    """
    x = Conv2D(filters, kernel_size=kernel_size, padding = 'same',
              strides = strides)(inputs)
    if Normalization == 'layer_normalization':
        x = LayerNormalization()(x)
    elif Normalization == 'batch_normalizatin':
        x = BatchNormalization()(x)
    elif Normalization == 'batch_renormalizatin':
        x = BatchNormalization(renorm = True)(x)
    else:
        print("Unknown Type of Input for Normalizatin")
    
    x = Activation(activation='relu')(x)
    return x


def Residual_Block(inputs, blocks = 3, filter_bank = [16, 16, 32], kernel_size = 3,
                   strides = 1, Normalization = 'layer_normalization'):
    """
    This function will be used to create the residual block. 
    
    Arguments:
    
    inputs --> This is the input of shape (batch_size, rows, cols, channels)
    blocks -> This will define the number of blocks you want your model to have. The default value is 3.
    filter_bank --> This input contains the values of fitlers to be used in each residual block.
    kernel_size --> the size of the filter. The default value is 3x3
    strides --. A scalar integer. The default value is 1.
    Normalization --> This input is a string, which will decide the type of normalization,
                      you want to use in your model. The default value is 'layer_normalization'.
                      The other two options are 'batch_normalization' and 'batch_renormalization'.
                      
    Return:
    outputs --> This is the output of the block of shape (batch_size, rows, cols, filters)
    """
    x = inputs
    for block in range(blocks):
        for filters in filter_bank:
            x = CNNBlock(inputs=x, filters=filters)
        x = Add()([x, Conv2D(filters = filter_bank[-1], 
                             kernel_size = kernel_size, padding = 'same')(inputs)])
        inputs = x
    return x

def Transition_Block(inputs, filter_bank = [16, 16, 32], kernel_size = 3,
                     strides = 2, Normalization = 'layer_normalization'):
    """
    This function will be used to create the transition block. 
    
    Arguments:
    
    inputs --> This is the input of shape (batch_size, rows, cols, channels)
    blocks -> This will define the number of blocks you want your model to have. The default value is 3.
    filter_bank --> This input contains the values of fitlers to be used in each residual block.
    kernel_size --> the size of the filter. The default value is 3x3
    strides --. A scalar integer. The default value is 1.
    Normalization --> This input is a string, which will decide the type of normalization,
                      you want to use in your model. The default value is 'layer_normalization'.
                      The other two options are 'batch_normalization' and 'batch_renormalization'.
                      
    Return:
    outputs --> This is the output of the block of shape (batch_size, rows, cols, filters)
    """
    x = inputs
    for filters in filter_bank[:-1]:
        x = CNNBlock(inputs=x, filters=filters, strides = 1)
    x = CNNBlock(inputs = x, filters = filter_bank[-1], strides = strides)
    x = Add()([x, Conv2D(filters = filter_bank[-1], strides = strides, 
                         kernel_size = kernel_size, padding = 'same')(inputs)])
    inputs = x
    return x

def residual_model(inputs, blocks = 4,filter_bank = [16, 16, 32], kernel_size = 3,strides = 2, 
                   Normalization = 'layer_normalization', num_classes = 5):
    """
    This function will be used to create the the residual model. 
    
    Arguments:
    
    inputs --> This is the input of shape (batch_size, rows, cols, channels)
    input_shape --> This is a tuple, defining the shape of the input data (rows, cols, channesl). The
                    default value is (128, 128, 3)
    blocks -> This will define the number of blocks you want your model to have. The default value is 3.
    filter_bank --> This input contains the values of fitlers to be used in each residual block.
    kernel_size --> the size of the filter. The default value is 3x3
    strides --. A scalar integer. The default value is 1.
    Normalization --> This input is a string, which will decide the type of normalization,
                      you want to use in your model. The default value is 'layer_normalization'.
                      The other two options are 'batch_normalization' and 'batch_renormalization'.
    num_classes --> An integer, default is 5, equal to the number of classes.
                      
    Return:
    outputs --> This is the output of the block of shape (batch_size, rows, cols, filters)
    """

    x = CNNBlock(inputs)
    filter_bank = [int(filters * 0.5) for filters in filter_bank]
    for block in range(blocks):
        filter_bank = [filters * 2 for filters in filter_bank]
        x = Residual_Block(x, filter_bank = filter_bank)
        x = Transition_Block(x, filter_bank = filter_bank)
    if Normalization == 'layer_normalization':
        x = LayerNormalization()(x)
    elif Normalization == 'batch_normalizatin':
        x = BatchNormalization()(x)
    elif Normalization == 'batch_renormalizatin':
        x = BatchNormalization(renorm = True)(x)
    else:
        print("Unknown Type of Input for Normalizatin")
    x = Activation('relu')(x)
    x = AveragePooling2D()(x)
    x = Flatten()(x)
    return x

def auxilary_model(inputs):
    """
    This will create a simple auxiliary model to help our system in detecting the features.
    """
    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(inputs)
    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = MaxPooling2D(pool_size = (2,2), strides = 2, padding = 'same')(x)

    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = MaxPooling2D(pool_size = (2,2), strides = 2, padding = 'same')(x)

    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = MaxPooling2D(pool_size = (2,2), strides = 2, padding = 'same')(x)

    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = Conv2D(filters = 64, kernel_size = (3,3), padding = 'same', activation = 'relu')(x)
    x = MaxPooling2D(pool_size = (2,2), strides = 2, padding = 'same')(x)

    return Flatten()(x)


def final_model(input_shape = (128, 128, 3), blocks = 4,
                   filter_bank = [16, 16, 32], kernel_size = 3,strides = 2, 
                   Normalization = 'layer_normalization', num_classes = 5):
    inputs = Input(shape = input_shape)
    output1 = residual_model(inputs)
    output2 = auxilary_model(inputs)
    y = Concatenate()([output1, output2])
    outputs = Dense(units = num_classes, activation = 'softmax')(y)
    model = Model(inputs = inputs, outputs = outputs)
    return model