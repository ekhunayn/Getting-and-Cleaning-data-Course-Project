setwd('~/Desktop/courseara/submission/')
library(plyr)
#######################################################
#######################################################

# Step 1: Merges the training and the test sets to create one data set
#######################################################

x_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")

x_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")

#'x' data set
x_dataset <- rbind(x_train, x_test)

#'y' data set
y_dataset <- rbind(y_train, y_test)

#'subject' data set
subject_dataset <- rbind(subject_train, subject_test)

#######################################################

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#######################################################

features <- read.table("./UCI_HAR_Dataset/features.txt")

# get columns with mean() or std() names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

x_dataset <- x_dataset[, mean_std_features]

# fix the column names
names(x_dataset) <- features[mean_std_features, 2]

#######################################################

#Step 3: Uses descriptive activity names to name the activities in the data set.
#######################################################


activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")

# update values with correct activity names
y_dataset[, 1] <- activity_labels[y_dataset[, 1], 2]

# fix column name
names(y_dataset) <- "activity"

#######################################################

#Step 4: Appropriately labels the data set with descriptive variable names.
#######################################################

# fix column name
names(subject_dataset) <- "subject"

# create a single data set for all data
all_data <- cbind(x_dataset, y_dataset, subject_dataset)
#######################################################

#Step 5: From the data set in step 4, creates a second, independent
#       tidy data set with the average of each variable for each activity and each subject.
#######################################################

# 66 <- 68 columns but last two (activity and subject)
averages <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write the output result in file "averages.txt"
write.table(averages, "averages.txt", row.name=FALSE)
