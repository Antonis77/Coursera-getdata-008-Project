#This code merges and tides datasets from two groups of persons who participated in wearable computing experiment
#The first group is considered the "training" and the second group the "testing"

#Reading files into R variables
#---------------------------------------------------------------------------------------------------------
# THE WORKING DIRECTORY SHOULD BE SET IN ORDER FOR THE CODE TO WORK. 
# INPUT FILES "X_test.txt", "X_train.txt", "y_test.txt", "y_train.txt", "subject_test.txt", "subject_train.txt",
# "features.txt",SHOULD BE INCLUDED IN IT. OUTPUT FILES WILL ALSO BE WRITTEN IN THE WORKING DIRECTORY
#---------------------------------------------------------------------------------------------------------

#Load ply package required for function ddply
library(plyr)

#read the two data sets from respective directory
    testorig<-read.table("X_test.txt",header=FALSE,sep="")
    trainorig<-read.table("X_train.txt",header=FALSE,sep="")

#Read activities
    activity_test<-read.table("y_test.txt")
    activity_train<-read.table("y_train.txt")

#Read subject IDs
    subject_test<-read.table("subject_test.txt")
    subject_train<-read.table("subject_train.txt")
# ---------------------------------------------------------------------------------------------------------
  
#Merge the datasets by rows (STEP1)
    whole_dataset_orig<-rbind(testorig,trainorig)
    whole_activity<-rbind(activity_test,activity_train)
    whole_subject<-rbind(subject_test,subject_train)

#---------------------------------------------------------------------------------------------------------
#extract only mean and standard deviation values of each variable (where applicable) (STEP2)

#Name each variable (columns) with the features titles
    features<-read.table("features.txt",header=FALSE,sep="")

#Extract Columns
    colnames(whole_dataset_orig)<-features[[2]]
    y<-colnames(whole_dataset_orig)
    colsmean<-grep("mean()",y,fixed=TRUE)
    colsstd<-grep("std()",y,fixed=TRUE)
#    colsMean<-grep("Mean",y)
    dataset<-whole_dataset_orig[,c(colsmean,colsstd)]

#--------------------------------------------------------------------------------------------------------

#Add descriptive activity names, replaces numbers with corresponding text (STEP3)
    x<-whole_activity
    x<-replace(x,x==1,"WALKING")
    x<-replace(x,x==2,"WALKING UPSTAIRS")
    x<-replace(x,x==3,"WALKING DOWNSTAIRS")
    x<-replace(x,x==4,"SITTING")
    x<-replace(x,x==5,"STANDING")
    x<-replace(x,x==6,"LYING")

#Add 2 extra columns with the descriptive activity names and subject codes (Persons IDs)
    dataset2<-data.frame(x,whole_subject,dataset)
    colnames(dataset2)[c(1,2)]<-c("descriptiveactivityname","subjectid")

#Remove Columns with title including "angle" as those are considered not measurements but
#processed measurements
    drops<-grep("angle",names(dataset2),value=TRUE)
    dataset2<-dataset2[,!names(dataset2)%in%drops]

#----------------------------------------------------------------------------------------------------
#Rename Variables (column headers) with desrcrptive names remove gaps, punctuation
#and use lowercase letters (STEP4). Substitute "BodyBody' with 'body'
          colnames(dataset2)<-sub("^t","time",names(dataset2))
          colnames(dataset2)<-sub("tBody","timebody",names(dataset2))
          colnames(dataset2)<-sub("^f","frequency",names(dataset2))
          colnames(dataset2)<-sub("Acc","accelerometer",names(dataset2))
          colnames(dataset2)<-sub("Gyro","gyroscope",names(dataset2))
          colnames(dataset2)<-sub("Mag","magnitude",names(dataset2))
          colnames(dataset2)<-gsub("std","standarddeviation",names(dataset2))
          colnames(dataset2)<-gsub("()","",names(dataset2))
          colnames(dataset2)<-gsub("-","",names(dataset2))
          colnames(dataset2)<-gsub("Freq","frequency",names(dataset2))
          colnames(dataset2)<-gsub("BodyBody","body",names(dataset2))
          colnames(dataset2)<-tolower(colnames(dataset2))
          colnames(dataset2)<-gsub("[[:punct:]]", "", names(dataset2))
#-----------------------------------------------------------------------------------------------------    

#Calculate the mean value of each variable per subject ID and activity and write results to a file(STEP5)
    output2<-ddply(dataset2,.(descriptiveactivityname,subjectid),numcolwise(mean))
    write.table(output2,file="tidy_data.txt",row.name=FALSE)












