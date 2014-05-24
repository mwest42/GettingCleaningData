#README

##Assignment

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard 3. deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive activity names. 
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


##A note about the variables used in the final summary data

Including all of the variables that included a mean or standard deviation calculation would have resulted in a summary data table that had over 60 columns.  Instead, since the assignment mentions that mean and standard deviation of "measurements" should be use, a subset of columns was used.   The features_info file included with the downloaded data set mention that the raw data signals, called tacc and tgyro, were measuring linear acceleration and angular velocity.  tacc was split into the components tbodyacc and tgravacc for the body's acceleration and acceleration due to gravity.  tbodyacc, tgravacc, and tgyro, seem to be actual measurements, and are used in the summary.  The other variables, as features_info explains, are actually "derived" and are not really true measurements, so they are not included.


##Explanation of code

This code works with the working directory set to be the "UCI HAR Dataset" folder that was contained in the downloaded zip file (at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip").  The code goes into the separate "train" and "test" folders and reads the X_train and X_test files for the vector data.  Y_train and Y_test are read to get the subject numbers associated with each vector.  The variable names for both data sets are read from the features file.  This results in two data sets that have the same variable names for the columns, and different sets of subjects as the rows.  Knowing that both sets have the same column names, rbind can be used to create one data frame containing all the training and test data.

At this point the variable names are changed with a few steps: gsub is used to remove first the dashes, then gsub is used again to remove the closed parentheses, and then the name is made lower case.  The columns that are going to be used in the summary table are identified in a list.

Using ddply from the plyr package, the mean values of each variable are calculated for each combination of subject and activity.  The activity values are translated to their corresponding name, and the variable/column names are all converted to lowercase.

The final data summary includes columns for the subject #, activity, and the average mean and standard deviation calculations for each of the XYZ components of tbodyacc, tgravacc, and tgyro variables.