# GettingAndCleaningDataCourseFinalAssignment

## Repository for the final Assignment of Coursera Getting and Cleaning Data Course

The purpose of this project is to demonstrate your ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that 
can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions 
related to the project. 
You will be required to submit: 
   1) a tidy data set as described below, 
   2) a link to a Github repository with your script for performing the analysis 
   3) a code book that describes the variables, the data, and 
      any transformations or work that you performed to clean up the data 
	  called CodeBook.md. 
   4)  You should also include a README.md in the repo with your scripts. 
	  This repo explains how all of the scripts work and how they are connected.

as for point 4)

The repository contains the following folder/files:

README.md
  contains the information about scope and repository content
CodeBook.md
  a R Markdown Notebook describing the variables, the data and any transformation
  performed to achieve the assignment goals
activity_labels.txt 
  a .txt file containing the different activities recorded in the experiment
features.txt
  a .txt file containing the features names of the recorded variables of the
    experiments
features_info.txt
  a .txt file contining the information about how features were selected
'train/X_train.txt' 
  is the Training set.
'train/y_train.txt': 
  Training labels.
'test/X_test.txt': 
  Test set.
'test/y_test.txt': 
  Test labels.
run_analysis.R
  a .R script performing the analysis - see CodeBook.Rmd for further details
'result':
  is a subfolder containg the result files
## Notes about the experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 