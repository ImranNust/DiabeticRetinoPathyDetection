# Imports
import os
from utilities import model_creation, metrics_and_plots, data_processing
import tensorflow as tf

##### CODE FOR MODEL #####################


def main(data_path, augmentation = False, callbacks = None, rescale = 0, batch_size = 32, target_size = (128, 128), 
         display_images = True, learning_rate = 0.001, input_shape = (128, 128, 3), num_classes = 5, blocks = 4, 
         metrics = None, normalization = 'layer_normalization', epochs = 50):
    """
    This function will receive the path of the data directory and will return the model and history.
    
    Arguments:
    data_path --> This is a string, which contains the path of the directory.
    callbacks --> It will contain the callbacks.
    rescale --> A scalar, the default value is 0. The other possible value is 1/255.0
    batch_size --> A scalar, the default value is 32.
    target_size --> A tuple contains rows and cols. The default value is (128, 128).
    dipslay_images --> A boolean, the default value is True. It will decide whether to display images or not.
    learning_rate --> A floating point scalar with default value 0.001.
    input_shape --> A tuple with default value (128, 128, 3)
    num_classes --> A scalar, defining the number of classes the dataset has. The default value is 5
    blocks --> An integer, with default value 4. It will decide the number of residual blocks.
    METRICS --> A list containing the metrices you want your model to examiner. The default value is None.
    Normalization --> This input is a string, which will decide the type of normalization,
                      you want to use in your model. The default value is 'layer_normalization'.
                      The other two options are 'batch_normalization' and 'batch_renormalization'.
                      
    Return:
    model --> this is the trained model
    history --> this contains the history of the training
    """
    ## Data Preparation
    train_dir = os.path.join(data_path, 'train')
    test_dir = os.path.join(data_path, 'test')
    val_dir = os.path.join(data_path, 'validation')
    
    train_iterator = data_processing.generate_iterator(path=train_dir, augmentation=augmentation, rescale=rescale)
    test_iterator = data_processing.generate_iterator(path=test_dir, augmentation=False, shuffle=False, rescale=rescale)
    validation_iterator = data_processing.generate_iterator(path=val_dir, augmentation=False, shuffle=False, rescale = rescale)
    
    if display_images:
        data_processing.display_images(train_iterator)
        

    ################ Model Creation
    model = model_creation.final_model(input_shape=input_shape, num_classes=num_classes, blocks  = blocks)
    model.compile(optimizer = tf.keras.optimizers.Adam(learning_rate=learning_rate),
             loss = tf.keras.losses.CategoricalCrossentropy(),
             metrics = metrics)
    
    ############## Training
    history = model.fit(x = train_iterator, epochs = epochs, validation_data=validation_iterator,
                        callbacks=callbacks)
        
    return model, history
    