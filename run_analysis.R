# loading the necessary libraries
library(dplyr)
library(data.table)

# Setting the working directory in order to easily interact with data
# In order to reproduce the script this line must be changed
setwd('C:/Users/pacor/Desktop/Paolo/WIP/Coursera/03GettingAndCleaningData/finalAssignment/GITFinalAssignment/GettingAndCleaningDataCourseFinalAssignment/')

activity_labels <- readLines(con = './activity_labels.txt') 
activity_labels <- unlist(strsplit(activity_labels," "))
activity_labels <- activity_labels[1:length(activity_labels) %% 2 == 0]

# loading all features names into a list like structure

ds_features <- read.table('./features.txt', col.names = c('Number', 'FeatureName'), stringsAsFactors = FALSE)
feature_names <- ds_features$FeatureName

# loading complete X train\ X test dataset, with features_names as column names 
df_X_train <- fread('./train/X_train.txt', col.names = feature_names)
df_X_test <- fread('./test/X_test.txt', col.names = feature_names)

# some data set dimension 
print(paste0("The training dataset has: ", dim(df_X_train)[1], " measuremens and ",
             dim(df_X_train)[2], " variables"))
print(paste0("The testing dataset has: ", dim(df_X_test)[1], " measuremens and ",
             dim(df_X_test)[2], " variables"))

# Loading the subject train ID\ Subject test ID  
subject_train_ID <-  readLines(con = './train/subject_train.txt')
subject_train_ID <- as.integer(subject_train_ID)
# A more compact notation
subject_test_ID <- as.integer(readLines(con = './test/subject_test.txt'))

# transforming objects into dataframe will help in managing them

df_subject_train_ID <- data.frame(subject_train_ID)
df_subject_test_ID <- data.frame(subject_test_ID)

# Writing the different measurements for the SubjectID 
table(df_subject_train_ID$subject_train_ID)
table(df_subject_test_ID$subject_test_ID)

# Loading the y_train/y_test 
# then convert the value to the corresonding string in the activity_labels 
y_train <- as.integer(readLines(con = './train/y_train.txt'))
y_test <- as.integer(readLines(con = './test/y_test.txt'))

y_train_label <- activity_labels[y_train]
y_test_label <- activity_labels[y_test]

df_y_train <- data.frame(y_train_label)
df_y_test <- data.frame(y_test_label)

# merging the different entities to obtain a single data frame
# 1st column is Subject ID
# 2nd columns is labelled Activity
# 3rd to 562 columns is the X train datase with columns name as the feature names

df_train <- cbind(df_subject_train_ID, df_y_train, df_X_train)
df_test <- cbind(df_subject_test_ID, df_y_test, df_X_test)

# I rename the Subject train and subject test ID into the same column name
# SubjectID
# The Same for the y_test_label; y_train_label -> y_label
names(df_train)[1] <- "SubjectID"
names(df_test)[1] <- "SubjectID"

names(df_train)[2] <- "Activity"
names(df_test)[2] <- "Activity"

# writing both dataframe on file for a sanity check
# now I bind the row to obtain the whole data.frame

df <- rbind(df_train, df_test)
dim(df)
dim(df_train)[1] + dim(df_test)[1]
dim(df)[1]
dim(df_train)[2]
dim(df_test)[2]
dim(df)[2]

# In selecting the mean() and std() columns, the order is alternated
# In this way, the dataset is easier to read since it contains the mean
# and the standard deviation of each variable in consecutive columns

i1 <- c(rbind(feature_name_mean_index,feature_name_std_index))
index_df_reduced <- c(1, 2, i1, dim(df)[2])
df_reduced <- df[,index_df_reduced]


# As for step 4. of the assignemnt, the dataset variables are renamed - read 
# CodeBook.md for further details

names(df_reduced)<-gsub("Acc", "Accelerometer", names(df_reduced))
names(df_reduced)<-gsub("Gyro", "Gyroscope", names(df_reduced))
names(df_reduced)<-gsub("BodyBody", "Body", names(df_reduced))
names(df_reduced)<-gsub("Mag", "Magnitude", names(df_reduced))
names(df_reduced)<-gsub("^t", "Time", names(df_reduced))
names(df_reduced)<-gsub("^f", "Frequency", names(df_reduced))
names(df_reduced)<-gsub("-mean\\()", "Mean", names(df_reduced), ignore.case = TRUE)
names(df_reduced)<-gsub("-std\\()", "STD", names(df_reduced), ignore.case = TRUE)
names(df_reduced)<-gsub("angle", "Angle", names(df_reduced))
names(df_reduced)<-gsub("gravity", "Gravity", names(df_reduced))

df_reduced$Activity <- as.factor(df_reduced$Activity)
df_reduced$SubjectID <- as.factor(df_reduced$SubjectID)

# Writing the reduced dataset into a csv file
write.csv(df_reduced, './results/df_reduced.csv')

tidyDF_reduced <- tidyDF_reduced[order(tidyDF_reduced$Subject,tidyDF_reduced$Activity),]
write.table(tidyDF_reduced, file = "./results/TidyDF_reduced.txt", row.names = FALSE)
write.csv(tidyDF_reduced, './results/TidyDF_reduced.csv', row.names = FALSE)



