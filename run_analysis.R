###Getting and Cleaning Data (getdata-015) Course Project
###Napoleon Koskinas 21/06/2015

###This R script performs on data collected

run_analysis <- function(){
        
        #1.Merging the training and the test sets to create one data set
        #Read data from txt files and loading on variables
        xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
        xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
        yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
        yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
        subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
        subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
        
        #Combining data by rows
        featuresData <- rbind(xTrain, xTest)
        activityData <- rbind(yTrain, yTest)
        subjectData <- rbind(subjectTrain, subjectTest)
        
        #Setting names to variables
        names(subjectData) <- c("Subject")
        names(activityData) <- c("Activity")
        
        #Reading and adding features' names
        featuresNames <- read.table("./UCI HAR Dataset/features.txt")
        names(featuresData) <- featuresNames$V2
        
        #Merging data columns using cbind(),creating the final data frame
        finalData <- cbind(featuresData, subjectData, activityData)
        
        
        #2. Selecting and extracting only the measurements concerning standard deviation and mean
        subsetData <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
        specificNames <- c(as.character(subsetData), "Subject", "Activity" )
        finalData <- subset(finalData, select=specificNames)
        
        #3. Using descriptive activity names to name the activities 
        #in the data set read from activity_labels.txt
        activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
       
        #4. Replacing names with appropriate ones to descibe the variables
        names(finalData) <-gsub ("^t", "time", names(finalData))
        names(finalData) <-gsub ("^f", "frequency", names(finalData))
        names(finalData) <-gsub ("Acc", "Accelerometer", names(finalData))
        names(finalData) <-gsub ("Gyro", "Gyroscope", names(finalData))
        names(finalData) <-gsub ("Mag", "Magnitude", names(finalData))
        names(finalData) <-gsub ("BodyBody", "Body", names(finalData))
        
        
        #5. Creating a second, independent tidy data set with the average of each
        # variable for each activity and each subject
        library(plyr);
        tidyData <- aggregate(. ~Subject + Activity, finalData, mean)
        tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
        write.table(tidyData, file = "tidy_data.txt",row.name=FALSE)
        
        #To view the tidy_data table
        #tidyTable<-read.table("tidy_data.txt")
        #View(tidy)

}