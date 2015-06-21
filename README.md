Getting and Cleaning Data Course Project
========================================

The R script called run_analysis.R does the following:
------------------------------------------------------

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps needed to perform analysis:
---------------------------------
1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the zipped file so that you have a folder named "UCI HAR Dataset" in your working directory.
3. Place run_analysis.R in your working directory.
4. Download,install and require "reshape2" and "data.table" libraries.
5. Running source("run_analysis.R") and then run_analysis() on your terminal,will produce the tidy dataset.
