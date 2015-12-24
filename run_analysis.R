#### Getting and Cleaning Data Course Project #### 

##0. Load UCI HAR Datasets (assuming all data files are in the working directory)

##0.1. Load train dataset

X_train <- read.table("X_train.txt", sep="", dec = '.', header = FALSE)
dim(X_train) # [1] 7352  561
subject_train <- read.table("subject_train.txt", sep="", dec = '.', header = FALSE)
y_train <- read.table("y_train.txt", sep="", dec = '.', header = FALSE)

##0.2. Load test dataset

X_test <- read.table("X_test.txt", sep="", dec = '.', header = FALSE)
dim(X_test) # [1] 2947  561
subject_test <- read.table("subject_test.txt", sep="", dec = '.', header = FALSE)
y_test <- read.table("y_test.txt", sep="", dec = '.', header = FALSE)


##1.Merge the training and the test sets to create one data set.

train <- cbind(subject_train,y_train, X_train) #create a complete "train" dataset
test <- cbind(subject_test,y_test, X_test) #create a complete "test" dataset
data_all <- rbind(train,test) #Merge the training and the test sets to create one data set
dim(data_all) # [1] 10299   563


##2.Extract only the measurements on the mean & St.Dev for each measurement. 

##2.1. Load the "features.txt" file that contains the list of all features

features <- read.table("features.txt", sep="", dec = '.', header = FALSE)

##2.2. Assign column names for all features accordingly

colnames(data_all)[3:563] <- as.character(features$V2)

##2.3. Extract only the measurement columns for mean() & std(), 
##     along with first two identifier variables columns 

data_mean_std <- data_all[,which(grepl("V1|mean()|std()", colnames(data_all)))]
head(data_mean_std)
  # Note that V1 and V1.1 are the First two colume names for Subject ID and Activity, 
  # and these column names will be changed accordingly as follows: 

colnames(data_mean_std)[1] <- "Subject.ID"
colnames(data_mean_std)[2] <- "Activity"


##3.Use descriptive activity names to name the activities in the data set 

##3.1. Load the file "activity_labels.txt" that contains descriptive activity names

activity_names <- read.table("activity_labels.txt", header = FALSE)

##3.2. Use 'for' loop to systematically change the (integer) values of $Activity 
## to the corresponding descriptive names that are provided in "activity_labels.txt"

i=1
for (i in 1:6){
    data_mean_std$Activity[data_mean_std$Activity == i] <- as.character(activity_names$V2[i])
} 

class(data_mean_std$Activity) # [1] "character" 
# Note that the class of this variable is now "character". This will be changed to factor later.


##4.Appropriately labels the data set with descriptive variable names. 

names(data_mean_std) <- gsub("^t", "time", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "frequency", names(data_mean_std))
names(data_mean_std) <- gsub("Acc", "Accelerator", names(data_mean_std))
names(data_mean_std) <- gsub("Gyro", "Gyroscope", names(data_mean_std))
names(data_mean_std) <- gsub("Mag", "Magnitude", names(data_mean_std))


##5.From the data set in step 4, creates a second, independent tidy data set
##  with the average of each variable for each activity and each subject.

##5.1. Transform $Activity variable to a factor variable for easy subsetting

data_mean_std$Subject.ID <- as.factor(data_mean_std$Subject.ID)
data_mean_std$Activity <- as.factor(data_mean_std$Activity)

##5.2. Subset & summarize data by the factor variables 
## using the dplyr package:group_by()

library(dplyr)
data_by_groups <- group_by(data_mean_std,Subject.ID,Activity) 
tidydata <- summarise_each(data_by_groups,funs(mean))
dim(tidydata) # [1] 180  81
# 180 is the number of subjects multiplied by the number of activities
# 81 is the 79 measurements + 2 identifier variables(Subject.ID, Activity)

##5.3.create a txt file with write.table() using row.name=FALSE 
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)

## The END