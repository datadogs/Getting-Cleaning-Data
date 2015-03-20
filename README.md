# Coursera Data Science Track Module 3 - Getting and Cleaning Data

## About the Course Project:
## Instructions for obtaining the tidy output data using the techniques learnt
 
Code program run_analysis.R which will have the following capabilities/features: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Corresponding approach to the above features:

1. Merge Data sets:
   a. Download the data source and put into the working folder which already has the data set folder being unzipped from the assignment instructions. The             subfolder is [UCI HAR Dataset].
   b. Read the source tables in R. The source tables are : activity_labels | features | X_test | y_test | subject_test | X_train | y_train
   c. Map the column names in feature into the corresponding train and test data sets
2. Extracts only the mean and standard deviation measurements:
   a. Filter data set features to look for the column name that has the text "mean" or "std"
   b. Only the filtered matching data set will be selected for each of the test set
3. Use descriptive activity names:
   a. Merge y_test/t_train data sets and activity_labels to get a complete set with the names being matched by the ID
4. Appropriately labels the data set with descriptive activity names.
   a. Labels the data sets with the appropriate column name: X_test,X_train uses label as matched in step 2 by features data set, 
   b. y_test,y_train uses label [ActivityID, ActivityName], 
   c. subject_test, subject_train with only 1 column is labeled as [SubjectID]   
5. Creates a second, independant tidy data set with the average of each variable for each activity and each subject
   a. Combine subject_test, y_test, x_test to first obtain the full data set for test
   b. Repeat the same steps in (a) for subject_train, y_train, x_train to obtain full data set
   c. Combine the 2 full data sets into 1 single data set
   d. Transform the full data set such that it flattens the data set to show SubjectID, ActivityName and all the measurement columns in a single flattened table.
   e. Use dCast to pivot the flat data by SubjectID & ActivityName Against the Measurement variables. The summarised data to display the mean for each of the SubjectID       and ActivityName group.  	

## Important setup to take note.
1. Ensure you have data.table and reshape2 being installed in your R studio.
2. Ensure the program run_analysis.R is put inside the directory one level before the data set directory "UCI HAR Dataset"
3. Type source("run_analysis.R") to run the program. it will generate a new file "clean_fulldata.txt in the same working directory as the program.
4. The output file is read in as text file without any column headers. Preview the file, it should show the characteristics of clean and tidy data set with the assignment requirement.

