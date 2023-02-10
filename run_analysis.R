## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Load required libraries
library(dplyr)
# Step 1: Combine the training and test sets to create a single data set
# Load the training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load the test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Combine the training and test data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
# Step 2: Extract measurements on the mean and standard deviation for each measurement
# Load the features data
features <- read.table("UCI HAR Dataset/features.txt")
# Extract the mean and standard deviation measurements
mean_std_index <- grep("mean\\(\\)|std\\(\\)", features[, 2])
x_mean_std <- x_data[, mean_std_index]
# Step 3: Use descriptive activity names to name the activities in the dataset
# Load the activity labels data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Replace the activity IDs with descriptive activity names
y_data[, 1] <- activity_labels[y_data[, 1], 2]
# Step 4: Label the data set appropriately with the names of the descriptive variables
# Assign descriptive variable names
names(subject_data) <- "subject"
names(y_data) <- "activity"
names(x_mean_std) <- features[mean_std_index, 2]
names(x_mean_std)  = gsub('-mean', 'Mean', names(x_mean_std) )
names(x_mean_std)  = gsub('-std', 'Std', names(x_mean_std) )
names(x_mean_std)   <- gsub('-', '', names(x_mean_std)  )
names(x_mean_std)   <- gsub('[()]', '', names(x_mean_std)  )
# Combine the subject, activity, and measurement data
data <- cbind(subject_data, y_data, x_mean_std)

