This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook that
describes the variables, the data, and any transformations or work that
performed to clean up the data for the Final Assignment of the Getting
and Cleaning Data Course.

Original
[data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Original [description of the
dataset:](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data Set
========

The dataset includes the following files:

‘features\_info.txt’: Shows information about the variables used on the
feature vector.

‘features.txt’: List of all features.

‘activity\_labels.txt’: Links the class labels with their activity name.

TRAINING AND TESTING SETS

‘train/subject\_train.txt’: Each row identifies the subject who
performed the activity for each window sample. Its range is from 1 to
30.

‘train/Inertial Signals/total\_acc\_x\_train.txt’: The acceleration
signal from the smartphone accelerometer X axis in standard gravity
units ‘g’. Every row shows a 128 element vector. The same description
applies for the ‘total\_acc\_x\_train.txt’ and
‘total\_acc\_z\_train.txt’ files for the Y and Z axis.

‘train/Inertial Signals/body\_acc\_x\_train.txt’: The body acceleration
signal obtained by subtracting the gravity from the total acceleration.

‘train/Inertial Signals/body\_gyro\_x\_train.txt’: The angular velocity
vector measured by the gyroscope for each window sample. The units are
radians/second.

Variables
=========

In the original Data Set for each record it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and
the estimated body acceleration. Triaxial Angular velocity from the
gyroscope. A 561-feature vector with time and frequency domain
variables.  
Its activity label. An identifier of the subject who carried out the
experiment.

as for the reduced data set, the variable names are the following:

SubjectID  
Activity  
TimeBodyAccelerometerMean-X  
TimeBodyAccelerometerSTD-X  
TimeBodyAccelerometerMean-Y  
TimeBodyAccelerometerSTD-Y  
TimeBodyAccelerometerMean-Z  
TimeBodyAccelerometerSTD-Z  
TimeGravityAccelerometerMean-X  
TimeGravityAccelerometerSTD-X  
TimeGravityAccelerometerMean-Y  
TimeGravityAccelerometerSTD-Y  
TimeGravityAccelerometerMean-Z  
TimeGravityAccelerometerSTD-Z  
TimeBodyAccelerometerJerkMean-X  
TimeBodyAccelerometerJerkSTD-X  
TimeBodyAccelerometerJerkMean-Y  
TimeBodyAccelerometerJerkSTD-Y  
TimeBodyAccelerometerJerkMean-Z  
TimeBodyAccelerometerJerkSTD-Z  
TimeBodyGyroscopeMean-X  
TimeBodyGyroscopeSTD-X  
TimeBodyGyroscopeMean-Y  
TimeBodyGyroscopeSTD-Y  
TimeBodyGyroscopeMean-Z  
TimeBodyGyroscopeSTD-Z  
TimeBodyGyroscopeJerkMean-X  
TimeBodyGyroscopeJerkSTD-X  
TimeBodyGyroscopeJerkMean-Y  
TimeBodyGyroscopeJerkSTD-Y  
TimeBodyGyroscopeJerkMean-Z  
TimeBodyGyroscopeJerkSTD-Z  
TimeBodyAccelerometerMagnitudeMean  
TimeBodyAccelerometerMagnitudeSTD  
TimeGravityAccelerometerMagnitudeMean  
TimeGravityAccelerometerMagnitudeSTD  
TimeBodyAccelerometerJerkMagnitudeMean  
TimeBodyAccelerometerJerkMagnitudeSTD  
TimeBodyGyroscopeMagnitudeMean  
TimeBodyGyroscopeMagnitudeSTD  
TimeBodyGyroscopeJerkMagnitudeMean  
TimeBodyGyroscopeJerkMagnitudeSTD  
FrequencyBodyAccelerometerMean-X  
FrequencyBodyAccelerometerSTD-X  
FrequencyBodyAccelerometerMean-Y  
FrequencyBodyAccelerometerSTD-Y  
FrequencyBodyAccelerometerMean-Z  
FrequencyBodyAccelerometerSTD-Z  
FrequencyBodyAccelerometerJerkMean-X  
FrequencyBodyAccelerometerJerkSTD-X  
FrequencyBodyAccelerometerJerkMean-Y  
FrequencyBodyAccelerometerJerkSTD-Y  
FrequencyBodyAccelerometerJerkMean-Z  
FrequencyBodyAccelerometerJerkSTD-Z  
FrequencyBodyGyroscopeMean-X  
FrequencyBodyGyroscopeSTD-X  
FrequencyBodyGyroscopeMean-Y  
FrequencyBodyGyroscopeSTD-Y  
FrequencyBodyGyroscopeMean-Z  
FrequencyBodyGyroscopeSTD-Z  
FrequencyBodyAccelerometerMagnitudeMean  
FrequencyBodyAccelerometerMagnitudeSTD  
FrequencyBodyAccelerometerJerkMagnitudeMean
FrequencyBodyAccelerometerJerkMagnitudeSTD
FrequencyBodyGyroscopeMagnitudeMean  
FrequencyBodyGyroscopeMagnitudeSTD  
FrequencyBodyGyroscopeJerkMagnitudeMean  
FrequencyBodyGyroscopeJerkMagnitudeSTD

Strategy for cleaning the data
==============================

Merging Databases
-----------------

`activity_labels` is a list of the different activities recorded by the
device the original labels are modified by removing the prefix number
and just leaving the activity (this point fullfils the point 3. of the
final assignment: 3. Uses descriptive activity names to name the
activities in the data set). These are loaded into a list like structure
`ds_features`

The complete X train X test dataset are loaded into `df_X_train` and
`df_X_test` with features\_names as column names.

The subject train and test ID are loaded from the corresponding .txt
files into `df_subject_train_ID` and `df_subject_test_ID`

`df_y_train` and `df_y_test` are the target training and test sets

Finally all the entities are merged into a single training and testing
data set with:

-   1st column is Subject ID
-   2nd columns is labelled Activity
-   3rd to 564 columns is the X train datase with columns name as the
    feature names

and the Subject train and subject test are renamed in order to have the
same column name

the whole training and testing set are then combined by row binding them
to obtaing `df` the complete data frame with all available data

Selecting features
------------------

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Using `grep` function, there will be considered only the Features Names
containing the strings “mean()” and “std()”. In selecting the mean() and
std() columns, the order is alternated. In this way, the dataset is
easier to read since it contains the mean and the standard deviation of
each variable in consecutive columns.

Variable rename
===============

4. Appropriately labels the data set with descriptive variable names.
---------------------------------------------------------------------

As for step 4. of the assignemnt, the dataset variables are renamed - a
starting ‘t’ is changed in Time - a starting ‘f’ is changed in Frequency
- ‘BodyBody’ is changed in Body - ‘-mean’ is changed in Mean - ‘-std’ is
changed in STD - ‘Acc’ is changed in Accelerometer - ‘Gyro’ is changed
in Gyroscome - ‘mag’ is changed in Magnitude - ‘angle’ is changed in
Angle - ‘gravity’ is changed in Gravity

Creating Tidy dataset
=====================

4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
-------------------------------------------------------------------------------------------------------------------------------------------------

The `aggregate` and `order` function has been used to fulfill point 4.
the Tidy datased, named `TidyDF_reduced.txt` is saved in the `result`
subfolder.
