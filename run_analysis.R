## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# load the library data.table and reshape2
library("data.table")
library("reshape2")

# Read in the Test Data Sets: subj_test, X_test & y_test data.
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Read in the Test Data Sets X_train & y_train data.
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# read the label files - features and activity labels
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
act_lb <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
mean_std_features <- grepl("mean|std", features)

# map the column names
names(x_test) = features
names(x_train) = features

# Extract mean and standard deviation for each measurement.
x_test = x_test[,mean_std_features]
x_train = x_train[,mean_std_features]

# Load activity labels and map the id of the y_test and y_train
y_test[,2] = act_lb[y_test[,1]] 
y_train[,2] = act_lb[y_train[,1]]

# assign labels for y_test and y_train
names(y_test) = c("act_ID", "act_lb")
names(y_train) = c("act_ID", "act_lb")

# assign labels for subj_test and subject_train
names(subj_test) = "Subject"
names(subj_train) = "Subject"

# Column bind the data into 1 table
test_data <- cbind(as.data.table(subj_test), y_test, x_test)
train_data <- cbind(as.data.table(subj_train), y_train, x_train)

# Row Bind the test and train data
all_data = rbind(test_data, train_data)


var_labels   = c("Subject", "act_ID", "act_lb")
measure_labels = setdiff(colnames(all_data), var_labels)

# melt data in a flat file for pivoting
flat_data = melt(all_data, id = var_labels, measure.vars = measure_labels)

# Using dcast function to pivot table
final_data   = dcast(flat_data, Subject + act_lb ~ variable, mean)

write.table(final_data, file = "./final_data.txt", row.names=FALSE)
