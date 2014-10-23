##Coursera-getdata-008-Project

Averages data from wearable computing experiment and creates a tidy data set with results of selceted measurements. All variables have been normalised and bounded within [-1,1]. Therefore all variables are dimensionless and so codebook shows no units for the variables.

##Required Packages

The script below includes functions from the "plyr" package and therefore package need to be installed in the running computer.

##IMPORTANT NOTE
THE WORKING DIRECTORY SHOULD BE SET IN ORDER FOR THE CODE TO WORK.  INPUT FILES "X_test.txt", "X_train.txt", "y_test.txt", "y_train.txt", "subject_test.txt", "subject_train.txt", "features.txt",SHOULD BE INCLUDED IN IT. OUTPUT FILES (tidy_data.txt) WILL ALSO BE WRITTEN IN THE WORKING DIRECTORY


##Code Description

The developed script (run_analysis.R) performs the following tasks 

1) Merges the training and the test sets to create one data set. This includes the measurement results, the activities and the subject (persons) IDs. 

2) Extracts only the measurements on the mean and standard deviation for each measurement type. After this filtering out of 561 initial variables 77 remain. Variables with the string 'BodyBody' in their name are considered erroneous and are also removed 

3) Uses descriptive activity names to name the activities in the data set. The correlation between activity numbers and names is the following 1 - "WALKING" 2 - "WALKING UPSTAIRS" 3- "WALKING DOWNSTAIRS" 4 - "SITTING" 5 - "STANDING" 6 -"LYING" The descriptive activity labels and the subject IDs are added to the 2 first columns of the dataset and so the variables increase from 77 to 79. 

4) Appropriately labels the data set with descriptive variable names. The following rules are applied: 
- Abbreviations are expanded to the whole text (e.g. 'acc' to 'accelerometer') 
- Spaces and Punctuation symbols are revoved (e.g. undersores, commas) 
- All letters are set to lowercase 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. To perform this task functions from "plyr" package have been used. 

##Output File Description

The output file is this repository with the name "tidy_data.txt". It consists of data in 181 rows and 79 columns. The first row is the variable (columns) labels. Each of the other 180 rows represent one activity combination with one subject ID. (6 activities x 30 subjects) as shown in columns 1 and 2 respectively. Columns 3 to 79 contain the averaged values for each variable. Row names have not been included.
