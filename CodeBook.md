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
