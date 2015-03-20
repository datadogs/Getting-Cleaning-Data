# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 

## The data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


## Transformation details

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