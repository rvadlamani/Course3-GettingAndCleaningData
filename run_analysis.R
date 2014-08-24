if (!("reshape2" %in% rownames(installed.packages())) ) { 
11   print("Please install required package \"reshape2\" before proceeding") 
12 } else { 

##setwd("C:/Ramesh/JHCourse/Course3Project/UCIHARDataset")
library(reshape2)

#get all the activity details with respective headers and the features
activites <- read.table("activity_labels.txt",col.names=c("activityID","activityName"))
features <- read.table("features.txt")
fea_names <- features[,2]

#read the data and associate the column names
testdata <- read.table("test/X_test.txt")
colnames(testdata) <- fea_names

traindata <-read.table("train/X_train.txt")
colnames(traindata) <- fea_names

#handle the IDs of the test subjects
testSubjID <- read.table("test/subject_test.txt") 
colnames(testSubjID) <- "subjectID" 

testActID <- read.table("test/y_test.txt") 
colnames(testActID) <- "activityID" 


trainSubjID <- read.table("train/subject_train.txt") 
colnames(trainSubjID) <- "subjectID" 

trainActID <- read.table("train/y_train.txt") 
colnames(trainActID) <- "activityID" 
          
#combine the data with the meta data
cleanTestData <- cbind(testSubjID , testActID , testdata)
cleanTrainData <- cbind(trainSubjID , trainActID , traindata) 

#combine Test and Train Data
allData <- rbind(cleanTrainData,cleanTestData)

##get  mean or std values 
meanColIDS <- grep("mean",names(allData),ignore.case=TRUE) 
meanColNames <- names(allData)[meanColIDS] 
stdColIDS <- grep("std",names(allData),ignore.case=TRUE) 
strColNames <- names(allData)[stdColIDS] 
meanDataSet <-allData[,c("subjectID","activityID",meanColNames,strColNames)] 


#Melt the dataset with the descriptive activity names for better handling 
descrNames <- merge(activites,meanDataSet,by.x="activityID",by.y="activityID",all=TRUE)
dataMelt <- melt(descrNames,id=c("activityID","activityName","subjectID")) 



#Cast the melted dataset according to  the average of each variable  
#for each activity and each subject 
mean_data <- dcast(dataMelt,activityID + activityName + subjectID ~ variable,mean) 
     
## Create a file with the new tidy dataset 
write.table(mean_data,"tidy_movement_data.txt") 



}