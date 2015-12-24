# Code Book for the Tidy Data Set of Human Activity Recognition Using Smartphones Dataset

## Original Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Please visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for further details about this dataset. 


## Tidy Data Set Information:

The tidy data set, "tidydata.txt", has been created by the following steps.

1.	Merged the training data set("X_train.txt", 7352 rows, 561 columns; "subject_train.txt", 7352 rows, 1 column;"y_train.txt", 7352 rows, 1 column) and the test data ("X_test.txt", 2947 rows, 561 columns; "subject_test.txt", 2947 rows, 1 column; "y_test.txt", 2947 rows, 1 column) to create one combined data set (10299 rows, 563 columns).

2.	Extracted only the measurements on the mean and standard deviation for each measurement: In R, 'grepl()' function was used to select columns that contain either mean() or std() in the column names for the measurements.
  
3.	Used descriptive activity names to name the activities in the data set: In R, changed the (integer) values of the 'Activity' variable to the corresponding descriptive names that are provided in "activity_labels.txt".
      
4.	Labelled the data set with more descriptive variable names, by replacing some of the abbreviates used in column names to more descriptive words, using gsub() function in R, as follows:
    t --> time, f --> frequency, Acc --> Accelerator, Gyro --> Gyroscope, Mag --> Magnitude 
   
5.	From the data set in step 4, created a tidy data set with the average of each variable for each activity and each subject, using the group_by() function in the dplyr package. The tidy data set (180 rows, 81 columns) was saved as a text file, "tidydata.txt": 180 rows corresponds to the number of subjects multiplied by the number of activities. 81 columns consist of the 79 measurements variables and 2 identifier variables(Subject.ID, Activity)
 
 
## LIST OF VARIABLES

The following variables are included in the tidy data set:

 [1] "Subject.ID"                                          
 [2] "Activity"                                            
 [3] "timeBodyAccelerator-mean()-X"                        
 [4] "timeBodyAccelerator-mean()-Y"                        
 [5] "timeBodyAccelerator-mean()-Z"                        
 [6] "timeBodyAccelerator-std()-X"                         
 [7] "timeBodyAccelerator-std()-Y"                         
 [8] "timeBodyAccelerator-std()-Z"                         
 [9] "timeGravityAccelerator-mean()-X"                     
[10] "timeGravityAccelerator-mean()-Y"                     
[11] "timeGravityAccelerator-mean()-Z"                     
[12] "timeGravityAccelerator-std()-X"                      
[13] "timeGravityAccelerator-std()-Y"                      
[14] "timeGravityAccelerator-std()-Z"                      
[15] "timeBodyAcceleratorJerk-mean()-X"                    
[16] "timeBodyAcceleratorJerk-mean()-Y"                    
[17] "timeBodyAcceleratorJerk-mean()-Z"                    
[18] "timeBodyAcceleratorJerk-std()-X"                     
[19] "timeBodyAcceleratorJerk-std()-Y"                     
[20] "timeBodyAcceleratorJerk-std()-Z"                     
[21] "timeBodyGyroscope-mean()-X"                          
[22] "timeBodyGyroscope-mean()-Y"                          
[23] "timeBodyGyroscope-mean()-Z"                          
[24] "timeBodyGyroscope-std()-X"                           
[25] "timeBodyGyroscope-std()-Y"                           
[26] "timeBodyGyroscope-std()-Z"                           
[27] "timeBodyGyroscopeJerk-mean()-X"                      
[28] "timeBodyGyroscopeJerk-mean()-Y"                      
[29] "timeBodyGyroscopeJerk-mean()-Z"                      
[30] "timeBodyGyroscopeJerk-std()-X"                       
[31] "timeBodyGyroscopeJerk-std()-Y"                       
[32] "timeBodyGyroscopeJerk-std()-Z"                       
[33] "timeBodyAcceleratorMagnitude-mean()"                 
[34] "timeBodyAcceleratorMagnitude-std()"                  
[35] "timeGravityAcceleratorMagnitude-mean()"              
[36] "timeGravityAcceleratorMagnitude-std()"               
[37] "timeBodyAcceleratorJerkMagnitude-mean()"             
[38] "timeBodyAcceleratorJerkMagnitude-std()"              
[39] "timeBodyGyroscopeMagnitude-mean()"                   
[40] "timeBodyGyroscopeMagnitude-std()"                    
[41] "timeBodyGyroscopeJerkMagnitude-mean()"               
[42] "timeBodyGyroscopeJerkMagnitude-std()"                
[43] "frequencyBodyAccelerator-mean()-X"                   
[44] "frequencyBodyAccelerator-mean()-Y"                   
[45] "frequencyBodyAccelerator-mean()-Z"                   
[46] "frequencyBodyAccelerator-std()-X"                    
[47] "frequencyBodyAccelerator-std()-Y"                    
[48] "frequencyBodyAccelerator-std()-Z"                    
[49] "frequencyBodyAccelerator-meanFreq()-X"               
[50] "frequencyBodyAccelerator-meanFreq()-Y"               
[51] "frequencyBodyAccelerator-meanFreq()-Z"               
[52] "frequencyBodyAcceleratorJerk-mean()-X"               
[53] "frequencyBodyAcceleratorJerk-mean()-Y"               
[54] "frequencyBodyAcceleratorJerk-mean()-Z"               
[55] "frequencyBodyAcceleratorJerk-std()-X"                
[56] "frequencyBodyAcceleratorJerk-std()-Y"                
[57] "frequencyBodyAcceleratorJerk-std()-Z"                
[58] "frequencyBodyAcceleratorJerk-meanFreq()-X"           
[59] "frequencyBodyAcceleratorJerk-meanFreq()-Y"           
[60] "frequencyBodyAcceleratorJerk-meanFreq()-Z"           
[61] "frequencyBodyGyroscope-mean()-X"                     
[62] "frequencyBodyGyroscope-mean()-Y"                     
[63] "frequencyBodyGyroscope-mean()-Z"                     
[64] "frequencyBodyGyroscope-std()-X"                      
[65] "frequencyBodyGyroscope-std()-Y"                      
[66] "frequencyBodyGyroscope-std()-Z"                      
[67] "frequencyBodyGyroscope-meanFreq()-X"                 
[68] "frequencyBodyGyroscope-meanFreq()-Y"                 
[69] "frequencyBodyGyroscope-meanFreq()-Z"                 
[70] "frequencyBodyAcceleratorMagnitude-mean()"            
[71] "frequencyBodyAcceleratorMagnitude-std()"             
[72] "frequencyBodyAcceleratorMagnitude-meanFreq()"        
[73] "frequencyBodyBodyAcceleratorJerkMagnitude-mean()"    
[74] "frequencyBodyBodyAcceleratorJerkMagnitude-std()"     
[75] "frequencyBodyBodyAcceleratorJerkMagnitude-meanFreq()"
[76] "frequencyBodyBodyGyroscopeMagnitude-mean()"          
[77] "frequencyBodyBodyGyroscopeMagnitude-std()"           
[78] "frequencyBodyBodyGyroscopeMagnitude-meanFreq()"      
[79] "frequencyBodyBodyGyroscopeJerkMagnitude-mean()"      
[80] "frequencyBodyBodyGyroscopeJerkMagnitude-std()"       
[81] "frequencyBodyBodyGyroscopeJerkMagnitude-meanFreq()" 

Notes: 
======
- Features (all columns except 1st two columns, "Subject.ID" and "Activity") are "normalized" and bounded within [-1,1], which are inherited from the original train and test data sets. 
That is, all variable values are unit-less.

