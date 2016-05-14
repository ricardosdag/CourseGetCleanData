This is the structure of RunAnalysis.R and de TidyData.txt

##RunAnalysis.R

1. Create Folder
  1. Download data to folder
  2. Unzip DataSet to folder

2. Load packages
  1. dplyr
  2. data.table
  3. tidyr

3. Read files and create data tables
  1. Read subject files
  2. Read activity files
  3. Read data files.

4. Merges the training and the test sets to create one data set.
  1. for both Activity and Subject files this will merge the training and the test sets by row binding and rename variables "subject" and "activityNum"
  2. combine the DATA training and test files
  3. name variables according to feature
  4. column names for activity labels
  5. Merge columns

5. Extracts only the measurements on the mean and standard deviation for each measurement.
  1. Reading "features.txt" and extracting only the mean and standard deviation
  2. Taking only measurements for the mean and standard deviation and add "subject","activityNum"

6. Uses descriptive activity names to name the activities in the data set
  1. enter name of activity into dataTable
  2. create dataTable with variable means sorted by subject and Activity

7. Appropriately labels the data set with descriptive variable names.
  1. show names before
  2. show names after

8. From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  1. write to text file results path

##TidyData.txt

###Contains 181 rows 

The rows contains 30 subject and 6 activityName: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

###Contains 69 columns 

The columns are named by:

- subject
- activityName
- activityNum
- timeBodyAccelerometer-MEAN()-X
- timeBodyAccelerometer-MEAN()-Y
- timeBodyAccelerometer-MEAN()-Z
- timeBodyAccelerometer-SD()-X
- timeBodyAccelerometer-SD()-Y
- timeBodyAccelerometer-SD()-Z
- timeGravityAccelerometer-MEAN()-X
- timeGravityAccelerometer-MEAN()-Y
- timeGravityAccelerometer-MEAN()-Z
- timeGravityAccelerometer-SD()-X
- timeGravityAccelerometer-SD()-Y
- timeGravityAccelerometer-SD()-Z
- timeBodyAccelerometerJerk-MEAN()-X
- timeBodyAccelerometerJerk-MEAN()-Y
- timeBodyAccelerometerJerk-MEAN()-Z
- timeBodyAccelerometerJerk-SD()-X
- timeBodyAccelerometerJerk-SD()-Y
- timeBodyAccelerometerJerk-SD()-Z
- timeBodyGyroscope-MEAN()-X
- timeBodyGyroscope-MEAN()-Y
- timeBodyGyroscope-MEAN()-Z
- timeBodyGyroscope-SD()-X
- timeBodyGyroscope-SD()-Y
- timeBodyGyroscope-SD()-Z
- timeBodyGyroscopeJerk-MEAN()-X
- timeBodyGyroscopeJerk-MEAN()-Y
- timeBodyGyroscopeJerk-MEAN()-Z
- timeBodyGyroscopeJerk-SD()-X
- timeBodyGyroscopeJerk-SD()-Y
- timeBodyGyroscopeJerk-SD()-Z
- timeBodyAccelerometerMagnitude-MEAN()
- timeBodyAccelerometerMagnitude-SD()
- timeGravityAccelerometerMagnitude-MEAN()
- timeGravityAccelerometerMagnitude-SD()
- timeBodyAccelerometerJerkMagnitude-MEAN()
- timeBodyAccelerometerJerkMagnitude-SD()
- timeBodyGyroscopeMagnitude-MEAN()
- timeBodyGyroscopeMagnitude-SD()
- timeBodyGyroscopeJerkMagnitude-MEAN()
- timeBodyGyroscopeJerkMagnitude-SD()
- frequencyBodyAccelerometer-MEAN()-X
- frequencyBodyAccelerometer-MEAN()-Y
- frequencyBodyAccelerometer-MEAN()-Z
- frequencyBodyAccelerometer-SD()-X
- frequencyBodyAccelerometer-SD()-Y
- frequencyBodyAccelerometer-SD()-Z
- frequencyBodyAccelerometerJerk-MEAN()-X
- frequencyBodyAccelerometerJerk-MEAN()-Y
- frequencyBodyAccelerometerJerk-MEAN()-Z
- frequencyBodyAccelerometerJerk-SD()-X
- frequencyBodyAccelerometerJerk-SD()-Y
- frequencyBodyAccelerometerJerk-SD()-Z
- frequencyBodyGyroscope-MEAN()-X
- frequencyBodyGyroscope-MEAN()-Y
- frequencyBodyGyroscope-MEAN()-Z
- frequencyBodyGyroscope-SD()-X
- frequencyBodyGyroscope-SD()-Y
- frequencyBodyGyroscope-SD()-Z
- frequencyBodyAccelerometerMagnitude-MEAN()
- frequencyBodyAccelerometerMagnitude-SD()
- frequencyBodyAccelerometerJerkMagnitude-MEAN()
- frequencyBodyAccelerometerJerkMagnitude-SD()
- frequencyBodyGyroscopeMagnitude-MEAN()
- frequencyBodyGyroscopeMagnitude-SD()
- frequencyBodyGyroscopeJerkMagnitude-MEAN()
- frequencyBodyGyroscopeJerkMagnitude-SD()
