# Getting-and-Cleaning-Data
##step 0: load packages
*loads the dplyr package
##step 1: download file
*downloads file from URL
##step 2: unzip file
*unzips files
##step 3: create a single training dataframe that has relevant info on data, subject and activity
*creates three dataframes with info on data, subject and activity
*renames columns in each of the three dataframes
*binds dataframes into a single data frame
##step 4: create a single testing dataframe that has relevant info on data, subject and activity
##step 4aii - read df of variable names relevant for testing data 
*creates three dataframes with info on data, subject and activity
*renames columns in each of the three dataframes
*binds dataframes into a single data frame
##step 5: merge training and testing set
*merges training and testing dataframe using rbind
##step 6: use descriptive activity names to name the activities in the dataset
*mutates row values in the activity column to signify type of activity (for example, "walking")
##step 7: extract only the measurements on the mean and standard deviation for each measurement
*extracts out only columns named subject, activity or containing mean() or std() in the column name
##step 8: create a second and independent tidy data set w/ the average of each var for each activity and each subject
*groups extracted dataframe by subject and activity
*takes average of all values
##step 9: write table for submission
*turns data from step 8 into a txt file for submission