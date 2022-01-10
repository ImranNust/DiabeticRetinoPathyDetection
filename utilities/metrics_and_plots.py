# Imports
import tensorflow as tf
import numpy as np
import os
import matplotlib.pyplot as plt
import matplotlib as mpl
import sklearn
import pandas as pd
import seaborn as sns
from sklearn.metrics import roc_curve, auc
from itertools import cycle
from sklearn.metrics import confusion_matrix


mpl.rcParams['figure.figsize'] = (12, 10)
colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
def plot_metrics(history):
    metrics = ['loss', 'prc', 'precision', 'recall', "Specificity", "Sensitivity"]
    for n, metric in enumerate(metrics):
        name = metric.replace("_"," ").capitalize()
        plt.subplot(2,3,n+1)
        plt.plot(history.epoch, history.history[metric], color='blue', linestyle = 'dashdot', label='Train')
        plt.plot(history.epoch, history.history['val_'+metric],color='red', linestyle="solid", label='Val')
        plt.xlabel('Epoch')
        plt.ylabel(name)
        plt.grid(visible = True, which = 'both', color= 'r', linestyle = 'dotted')
        if metric == 'loss':
            plt.ylim([0, plt.ylim()[1]])
        elif metric == 'auc':
            plt.ylim([0.8,1])
        else:
            plt.ylim([0,1])
        
        plt.legend()
        
        
def plot_cm(labels, predictions, p=0.5):
    cm = confusion_matrix(labels.argmax(axis=1), predictions.argmax(axis=1))
    plt.figure(figsize=(10,10))
    sns.heatmap(cm, annot=True, fmt="d")
    plt.title('Confusion matrix')
    plt.ylabel('Actual label')
    plt.xlabel('Predicted label')

    print('0 detected as 0 (True Negatives): ', cm[0][0])
    print('1 detected as 1 (True Negatives): ', cm[1][1])
    print('2 detected as 2 (True Negatives): ', cm[2][2])
    print('3 detected as 3 (True Negatives): ', cm[3][3])
    print('4 detected as 4 (True Negatives): ', cm[4][4])
    
    
    print('Legitimate Transactions Incorrectly Detected (False Positives): ', cm[0][1])
    print('Fraudulent Transactions Missed (False Negatives): ', cm[1][0])
    print('Fraudulent Transactions Detected (True Positives): ', cm[1][1])
    print('Total Fraudulent Transactions: ', np.sum(cm[1]))
    
    
#####################################################################################################
def plot_roc(y_test, y_score, n_classes):
    fpr = dict()
    tpr = dict()
    roc_auc = dict()
    for i in range(n_classes):
        fpr[i], tpr[i], _ = roc_curve(y_test[:, i], y_score[:, i])
        roc_auc[i] = auc(fpr[i], tpr[i])
    # Compute micro-average ROC curve and ROC area
    fpr["micro"], tpr["micro"], _ = roc_curve(y_test.ravel(), y_score.ravel())
    all_fpr = np.unique(np.concatenate([fpr[i] for i in range(n_classes)]))
    roc_auc["micro"] = auc(fpr["micro"], tpr["micro"])
    # Then interpolate all ROC curves at this points
    mean_tpr = np.zeros_like(all_fpr)
    for i in range(n_classes):
        mean_tpr += np.interp(all_fpr, fpr[i], tpr[i])

    # Finally average it and compute AUC
    mean_tpr /= n_classes

    fpr["macro"] = all_fpr
    tpr["macro"] = mean_tpr
    roc_auc["macro"] = auc(fpr["macro"], tpr["macro"])
    # Plot all ROC curves
    plt.figure()
    colors = cycle(["aqua", "darkorange", "cornflowerblue", "lime",
                    "blue", "deeppink", "black", "tan", "green", "red"])
    for i, color in zip(range(n_classes), colors):
        plt.plot(
        fpr[i],
        tpr[i],
        color=color,
        lw=2,
        label="ROC curve of class {0} (area = {1:0.2f})".format(i, roc_auc[i]),
    )

    plt.plot([-1, 1], [-1, 1], "k--", lw=4)
    plt.xlim([-0.02, 1.0])
    plt.ylim([0.0, 1.1])
    plt.xlabel("False Positive Rate")
    plt.ylabel("True Positive Rate")
    plt.grid(visible = True, which = 'both', color= 'r', linestyle = 'dotted')
    plt.title("Receiver operating characteristic to multiclass")
    plt.legend(loc="best")
    plt.show()