##Experimental Design
*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
*These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
*Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
*Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
*Information above taken from "features_info" doc in zipped file at this URL: C:/Users/Clayton/Desktop/Course Project/Getting-and-Cleaning-Data/Samsung Data/Samsung Data.zip. 

##List of Variables - columns 1 and 2
*The first column "subject" gives a number (1-30) that denotes a particular participant.
*The second column "activity" originally gave a number (1-6) which denoted a particular activity (laying, sitting, standing, walking, walking upstairs, walking downstairs) before I mutated the row values to refer to the activities directly.
##List of variables -- remaining 66 columns
*These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag

*The set of variables that were estimated from these signals, and are of interest to the JHU assignment, are: 

-mean(): Mean value
-std(): Standard deviation

*As an FYI, additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-gravityMean
-tBodyAccMean
-tBodyAccJerkMean
-tBodyGyroMean
-tBodyGyroJerkMean

##Summary of Choices
*downloaded data from URL mentioned above
*unzipped data
*merged testing and training sets into one data frame
*renamed columns and one row with variables with features given from "features_info" doc mentioned above and activity labels doc in file downloaded from URL mentioned above
*extracted only columns on subject, activity and with mean() or std() in column name
* created tidy data set that reports mean of each extracted variable by subject and activity
