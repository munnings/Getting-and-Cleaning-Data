##step 1: download file
download.file(url, 
              destfile = "C:/Users/Clayton/Desktop/Course Project/Getting-and-Cleaning-Data/Samsung Data/Samsung Data.zip")
##step 2: unzip file
unzip("C:/Users/Clayton/Desktop/Course Project/Getting-and-Cleaning-Data/Samsung Data/Samsung Data.zip",
      exdir= "Samsung Data")
##step 3: create a single training dataframe (data) that has relevant info on data, subject and activity
##step 3ai - df w/ relevant info on data
trainset <- read.table("UCI HAR Dataset/train/x_train.txt")
##step 3aii - read df of variable names relevant for training data 
variablenames <- read.table("Samsung Data/UCI HAR Dataset/features.txt")
##step 3aiii - rename df replacing "V1:VN" w/ names from "variable names"
colnames(trainset) <- variablenames$V2
##step 3bi - df w/ info on subject
trainsubject0 <- read.table("UCI HAR Dataset/train/subject_train.txt")
##step 3bii - rename df column from "V1" to "subject"
trainsubject <- rename(trainsubject0, subject = V1) 
##step 3ci - df w/ info on activities
trainactivities0 <- read.table("UCI HAR Dataset/train/y_train.txt") 
##step 3cii - rename df column from "V1" to "activity"
trainactivities <- rename(trainactivities0, activity = V1)
##step 3d - cbind data, subject and activity into one df
traindata <- cbind(trainsubject, trainactivities, trainset)
##step 4: create a single testing dataframe (data) that has relevant info on data, subject and activity
##step 4ai - df w/ relevant info on data
testset <- read.table("UCI HAR Dataset/test/x_test.txt")
##step 4aii - read df of variable names relevant for testing data 
variablenames <- read.table("Samsung Data/UCI HAR Dataset/features.txt")
##step 4aiii - rename df replacing "V1:VN" w/ names from "variable names"
colnames(testset) <- variablenames$V2
##step 4bi - df w/ info on subject
testsubject0 <- read.table("UCI HAR Dataset/test/subject_test.txt")
##step 4bii - rename df column from "V1" to "subject"
testsubject <- rename(testsubject0, subject = V1) 
##step 4ci - df w/ info on activities
testactivities0 <- read.table("UCI HAR Dataset/test/y_test.txt") 
##step 4cii - rename df column from "V1" to "activity"
testactivities <- rename(testactivities0, activity = V1)
##step 4d - cbind data, subject and activity into one df
testdata <- cbind(testsubject, testactivities, testset)
##step 5: merge training and testing set
data1 <- rbind(traindata, testdata)
##step 6: use descriptive activity names to name the activities in the dataset
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
keys <- activitylabels$V1
values <- activitylabels$V2
names(values) <- keys
data1$activity <- values[data1$activity]
##step 7: extract only the measurements on the mean and standard deviation for each measurement
cols <- names(data1)
selectedcols <- grep("mean\\(\\)|std\\(\\)|activity|subject", cols)
data2 <- data1[,selectedcols]
##step 8: create a second and independent tidy data set w/ the average of each var
## for each activity and each subject
tidy_data <- data2 %>% 
  group_by(subject, activity) %>% 
  summarise_each(funs(mean))
##step 9: write table for submission
write.table(x = tidy_data, file = "tidy_data.txt", row.names = FALSE)