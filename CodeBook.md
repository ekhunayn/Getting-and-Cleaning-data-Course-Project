# Script File
`run_analysis.R` performs the following 5 steps which described in the course project assignment.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

So,
* For step one, all the similar data that have same number of columns and referring to the same entities are merged using `rbind()` function.
* For step two, we extract all columns with the mean and standard deviation measures from the dataset. Then, we fix their names by using the correct names in `features.txt` file.
* For step three, we take the activity names and IDs from `activity_labels.txt` then use them in dataset.
* For step four, we correct all columns names. Then, we create a single data set for all data.
* Finally, er create a new dataset with all average measures of each variable for each activity and each subject. Then, we write the results in output file called `averages.txt` (in this repo).

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` represents the data of the downloaded datasets files.
* `x_dataset`, `y_dataset` and `subject_dataset` contains the merged previous datasets and some analysis.
* `features` for the correct names of the `x_dataset` information, which are applied to the column names stored in `mean_std_features`, a numeric vector for the desired data.
* `activity_labels` variable for the correct names of the `y_dataset` information.
* `all_data` merges variables `x_dataset`, `y_dataset` and `subject_dataset` in a big single dataset.
* `averages` a variable that contains the results of output averages which stored in a `averages.txt` file.
* `ddply()` function from the plyr R package is used to apply `colMeans()`.

# Results
The resulted dataset contains the following data:
`subject` is a numerical ID unique to each subject under study
`activity` is text description of the activity undertaken during data collection.
And the rest of data represents measurements mean and std to the subject-activity level which have an X, Y, and Z components to correspond to the radial direction of each measure.
`tBodyAcc-mean()-X` `tBodyAcc-mean()-Y` `tBodyAcc-mean()-Z` `tBodyAcc-std()-X` `tBodyAcc-std()-Y` `tBodyAcc-std()-Z` `tGravityAcc-mean()-X` `tGravityAcc-mean()-Y` `tGravityAcc-mean()-Z` `tGravityAcc-std()-X` `tGravityAcc-std()-Y` `tGravityAcc-std()-Z` `tBodyAccJerk-mean()-X` `tBodyAccJerk-mean()-Y` `tBodyAccJerk-mean()-Z` `tBodyAccJerk-std()-X` `tBodyAccJerk-std()-Y` `tBodyAccJerk-std()-Z` `tBodyGyro-mean()-X` `tBodyGyro-mean()-Y` `tBodyGyro-mean()-Z` `tBodyGyro-std()-X` `tBodyGyro-std()-Y` `tBodyGyro-std()-Z` `tBodyGyroJerk-mean()-X`
`tBodyGyroJerk-mean()-Y` `tBodyGyroJerk-mean()-Z` `tBodyGyroJerk-std()-X` `tBodyGyroJerk-std()-Y` `tBodyGyroJerk-std()-Z` `tBodyAccMag-mean()` `tBodyAccMag-std()` `tGravityAccMag-mean()` `tGravityAccMag-std()` `tBodyAccJerkMag-mean()` `tBodyAccJerkMag-std()` `tBodyGyroMag-mean()` `tBodyGyroMag-std()` `tBodyGyroJerkMag-mean()` `tBodyGyroJerkMag-std()` `fBodyAcc-mean()-X` `fBodyAcc-mean()-Y` `fBodyAcc-mean()-Z` `fBodyAcc-std()-X` `fBodyAcc-std()-Y` `fBodyAcc-std()-Z` `fBodyAccJerk-mean()-X` `fBodyAccJerk-mean()-Y` `fBodyAccJerk-mean()-Z` `fBodyAccJerk-std()-X` 
`fBodyAccJerk-std()-Y` `fBodyAccJerk-std()-Z` `fBodyGyro-mean()-X` `fBodyGyro-mean()-Y` `fBodyGyro-mean()-Z` `fBodyGyro-std()-X` `fBodyGyro-std()-Y` `fBodyGyro-std()-Z` `fBodyAccMag-mean()` `fBodyAccMag-std()` `fBodyBodyAccJerkMag-mean()` `fBodyBodyAccJerkMag-std()` `fBodyBodyGyroMag-mean()` `fBodyBodyGyroMag-std()` `fBodyBodyGyroJerkMag-mean()` `fBodyBodyGyroJerkMag-std()`
