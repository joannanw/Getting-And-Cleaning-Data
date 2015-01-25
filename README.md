# Getting-And-Cleaning-Data
Course Project for Coursera Getting And Cleaning Data

Overview
========
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Code
====
The R script (run_analysis.R) performs data clean up through merging various data sources, matching related variables, updating column names, manipulating the values to achieve desired computation, and writing the resulting data set into text files. The text file "clean_har_data.txt" contains the clean data set, while the text file "summarized_mean_result.txt" contains only the average of each column grouped by subject and activity. Please proceed to read the CodeBook for more details on this script.

There is another README.txt in the folder UCI HAR Dataset that explains where the raw data is from and what it represents.
