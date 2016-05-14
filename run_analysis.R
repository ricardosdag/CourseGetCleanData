# 1. Create Folders 

MyFolder1 <- "/Users/ricardodagnino"
setwd(MyFolder1)
if(!file.exists("./CourseGetCleanData")){dir.create("./CourseGetCleanData")}

MyFolder2 <- "/Users/ricardodagnino/CourseGetCleanData"
setwd(MyFolder2)
if(!file.exists("./data")){dir.create("./data")}

# 1.1 Download data

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

#  1.2. Unzip DataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# 2. Load packages
library(dplyr)
library(data.table)
library(tidyr)

# 3. Read files and create data tables
UCIfolder <- "/Users/ricardodagnino/courseGetCleanData/data/UCI HAR Dataset"

# 3.1. Read subject files
dataSubTrain <- tbl_df(read.table(file.path(UCIfolder, "train", "subject_train.txt")))
dataSubTest  <- tbl_df(read.table(file.path(UCIfolder, "test" , "subject_test.txt" )))

# 3.2. Read activity files
dataActTrain <- tbl_df(read.table(file.path(UCIfolder, "train", "Y_train.txt")))
dataActTest  <- tbl_df(read.table(file.path(UCIfolder, "test" , "Y_test.txt" )))

# 3.3. Read data files.
dataTrain <- tbl_df(read.table(file.path(UCIfolder, "train", "X_train.txt" )))
dataTest  <- tbl_df(read.table(file.path(UCIfolder, "test" , "X_test.txt" )))

# 4. Merges the training and the test sets to create one data set.

# 4.1. for both Activity and Subject files this will merge the training and the test sets 
# by row binding and rename variables "subject" and "activityNum"

alldataSub <- rbind(dataSubTrain, dataSubTest)
setnames(alldataSub, "V1", "subject")
alldataAct<- rbind(dataActTrain, dataActTest)
setnames(alldataAct, "V1", "activityNum")

# 4.2. combine the DATA training and test files
dataTable <- rbind(dataTrain, dataTest)

# 4.3. name variables according to feature e.g.(V1 = "tBodyAcc-mean()-X")
dataFeatures <- tbl_df(read.table(file.path(UCIfolder, "features.txt")))
setnames(dataFeatures, names(dataFeatures), c("featureNum", "featureName"))
colnames(dataTable) <- dataFeatures$featureName

# 4.4. column names for activity labels
actLabels<- tbl_df(read.table(file.path(UCIfolder, "activity_labels.txt")))
setnames(actLabels, names(actLabels), c("activityNum","activityName"))

# 4.5. Merge columns
alldataSubAct<- cbind(alldataSub, alldataAct)
dataTable <- cbind(alldataSubAct, dataTable)

# 5. Extracts only the measurements on the mean and standard deviation for each measurement.

#  5.1. Reading "features.txt" and extracting only the mean and standard deviation
dataFeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",dataFeatures$featureName,value=TRUE) #var name

#  5.2. Taking only measurements for the mean and standard deviation and add "subject","activityNum"

dataFeaturesMeanStd <- union(c("subject","activityNum"), dataFeaturesMeanStd)
dataTable<- subset(dataTable,select=dataFeaturesMeanStd) 

# 6. Uses descriptive activity names to name the activities in the data set

##  6.1. enter name of activity into dataTable
dataTable <- merge(actLabels, dataTable , by="activityNum", all.x=TRUE)
dataTable$activityName <- as.character(dataTable$activityName)

##  6.2. create dataTable with variable means sorted by subject and Activity
dataTable$activityName <- as.character(dataTable$activityName)
dataAggr<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable<- tbl_df(arrange(dataAggr,subject,activityName))

# 7. Appropriately labels the data set with descriptive variable names.

#  7.1 show names before
head(str(dataTable),2)
names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

#  7.2 show names after
head(str(dataTable),6)

# 8. From the data set in previous step, creates a second, independent tidy 
#       data set with the average of each variable for each activity and each subject.

##  8.1. write to text file results path

setwd(MyFolder2)
if(!file.exists("./results")){dir.create("./results")}
setwd("/Users/ricardodagnino/CourseGetCleanData/results")
write.table(dataTable, "TidyData.txt", row.name=FALSE)

#  8.2. Read the finaltable and print str() and summary()
finaltable <- read.table("TidyData.txt")
str(finaltable)
summary(finaltable)
