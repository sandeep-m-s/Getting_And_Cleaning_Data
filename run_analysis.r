#File-download from the url
uci_har_files <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Files are unzipped and plcaed in Current Working Directory

#Data Extration step:-

#Extracting Training Set [Input] ('train/X_train.txt')
train_X <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\train\\X_train.txt")

#Extracting Testing Set [Input] ('test/X_test.txt')
test_X <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\test\\X_test.txt")

#1. Merging the training and the test sets to create one data set.
input_X <- rbind(train_X, test_X)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_and_std <- input_X[,grepl('mean\\(\\)|std\\(\\)',colnames(input_X))]


#3. Descriptive activity names used to name the activities in the data set

#Loading the training and testing outputs
train_Y <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\train\\y_train.txt")
test_Y <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\test\\y_test.txt")
output_Y <- rbind(train_Y, test_Y)

activity_labels <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\activity_labels.txt")

for (i in 1:nrow(activity_labels)) 
{
    key <- as.numeric(activity_labels[i, 1])
    val <- as.character(activity_labels[i, 2])
    output_Y[output_Y$activity == key, ] <- val
}

#4. Appropriately label the data set with descriptive activity names.
input_X_with_labels <- cbind(output_Y, input_X)
mean_and_std_with_labels <- cbind(output_Y, mean_and_std)

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

train_subject <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\train\\subject_train.txt", col.names = c('subject'))
test_subject <- read.table("C:\\Users\\Sandeep\\Documents\\UCI HAR Dataset\\test\\subject_test.txt", col.names = c('subject'))

subject <- rbind(train_subject, test_subject)

averages <- aggregate(input_X, by = list(activity = output_Y[,1], subject = subject[,1]), mean)

#Create the tidy data text file for upload
write.csv(averages, file='tidy_data.txt', row.names=FALSE)