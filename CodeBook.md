## Getting & Cleaning Data
## Course Project Code Book 
## By Joanna Widjaja (Jan 25, 2015)

Code
====
The R script included in this repo (run_analysis.R) cleans up the data and manipulates it in this way:

* Merges the training and the test sets to create one data set. X is a merge of the X_train with X_test data, Y is a merge of the y_train with y_test data, and S of the subject_test from both train and test. Here are the resulting dimensions:
**X = 10299x561
**Y = 10299x1
**S = 10299x1

* Extracts only the measurements on the mean and standard deviation for each measurement. This is done later on in the script by extracting columns from X that have the words '-std()' or '-mean()'. There are 66 variables that meet this criteria, resulting in a 10299x68 data table dimention.

* Uses descriptive activity names to name the activities in the data set. The activity names from activity_label.txt replace the numeric number from Y. The description are standardized to lower case with a spacing between words. Eg:
** 1 is replaced with "walking
** 2 is replaced with "walking upstairs"

* Appropriately labels the data set with descriptive variable names. The column names are put to lower case. Eg:
**tbodyacc-mean()-x
**tbodyacc-std()-y
**tgravityacc-mean()-y

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is done by creating a new empty matrix that filling in the subject_id, activity, and mean of each of the column according to the subject and activity. The resulting data dimension is 180x68.

