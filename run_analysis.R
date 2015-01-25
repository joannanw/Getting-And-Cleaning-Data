## Getting & Cleaning Data
## Course Project
## By Joanna Widjaja
## Jan 25, 2015

## 1. Merges the training and the test sets to create one data set.
temp1 <- read.table("UCI HAR Dataset/test/X_test.txt")
temp2 <- read.table("UCI HAR Dataset/train/X_train.txt")
X <- rbind(temp2, temp1)

temp1 <- read.table("UCI HAR Dataset/test/y_test.txt")
temp2 <- read.table("UCI HAR Dataset/train/y_train.txt")
Y <- rbind(temp2, temp1)

temp1 <- read.table("UCI HAR Dataset/test/subject_test.txt")
temp2 <- read.table("UCI HAR Dataset/train/subject_train.txt")
S <- rbind(temp2, temp1)

## 3. Uses descriptive activity names to name the activities in the data set
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
activity_label[,2] <- gsub("_", " ", tolower(activity_label[,2]))
Y[,1] <- activity_label[Y[,1],2]

## 4. Appropriately labels the data set with descriptive variable names. 
features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <- gsub("_", " ", tolower(features$V2))
names(X) <- tolower(features$V2)
names(Y) <- "activity"
names(S) <- "subject_id"

## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement. 
m_std_idx <- grep("-std\\(\\)|-mean\\(\\)", names(X))
X <- X[,m_std_idx]

clean_har_data <- cbind(S, Y, X)
write.table(clean_har_data, "clean_har_data.txt")

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
subject_id_count <- nrow(unique(S))
activity_count <- nrow(activity_label)

# Make result data frame
result <- matrix(0,nrow = (subject_id_count*activity_count), ncol = length(names(clean_har_data)))
result <- as.data.frame(result)
names(result) <- names(clean_har_data)
colLength <- length(names(clean_har_data))

row=1
i=1
j=1
for (i in 1:subject_id_count)
{
  for (j in 1:activity_count)
  {
    result[row,1] = unique(S)[i,1]
    result[row,2] = activity_label[j,2]
    result[row,3:colLength] <- colMeans(clean_har_data[clean_har_data$subject_id==unique(S)[i,1] & clean_har_data$activity == activity_label[j,2],3:colLength])
    row = row + 1
  }  
}

