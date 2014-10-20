Coursera-getdata-008-Project
============================

Averages data from wearable computing experiment and creates a tidy data set with results of selceted measurements
============================

IMPORTANT: 
============================
The script below includes functions from the "plyr" package and therefore package need to be installed in the running computer.
============================
CODE DESCRIPTION
============================
The developed script (run_analysis.R) performs the following tasks
    1. Merges the training and the test sets to create one data set. This includes the measurement results, the                activities and the subject (persons) IDs.
    2. Extracts only the measurements on the mean and standard deviation for each measurement type. After this filtering          out of  561 initial variables 77 remain. Variables with the string 'BodyBody' in their name are considered              erroneous and are also removed 
    3. Uses descriptive activity names to name the activities in the data set. The correlation between activity numbers        and names is the following
               1 - "WALKING"
               2 - "WALKING UPSTAIRS"
               3- "WALKING DOWNSTAIRS"
               4 - "SITTING"
               5 - "STANDING"
               6 -"LYING"
        The descriptive activity labels and the subject IDs are added to the 2 first columns of the dataset and so the          variables increase from 77 to 79.
    4. Appropriately labels the data set with descriptive variable names. The following rules are applied:
               1) Abbreviations are expanded to the whole text (e.g. 'acc' to 'accelerometer')
               2) Spaces and Punctuation symbols are revoved (e.g. undersores, commas)
               3) All letters are set to lowercase
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for          each activity and each subject. To perform this task functions from "plyr" package have been used. 
    ============================
OUTPUT FILE DESCRIPTION
The output file is this repository with the name "output.txt". It consists of data in 181 rows and 79 columns. The first row is the variable (columns) labels. Each of the other 180 rows represent one activity combination with one subject ID. (6 activities x 30 subjects) as shown in columns 1 and 2 respectively. Columns 3 to 79 contain the averaged values for each variable. Row names have not been included. 


