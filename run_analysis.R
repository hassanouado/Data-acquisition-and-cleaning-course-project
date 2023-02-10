## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Load required libraries
library(dplyr)
 # Load training datasets
x_train  <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train  <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
#combine  x_train, y_train and train_subjects                               
train_data = cbind(train_subjects, y_train, x_train)
# Load test datasets
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
# combine x_test,y_test and test_subjects
test_data = cbind(test_subjects , y_test , x_test )
# merge train and test datasets
dataAll<- rbind(train_data, test_data )
