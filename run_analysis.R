##load library 
library(dplyr)

##read in measurement names
nam<-read.table("features.txt")
##Read in the  measurements
testX<-read.table("test/X_test.txt", col.names=nam[,2])        ##test data
trainX<-read.table("train/X_train.txt", col.names=nam[,2])     ##train data
##Read in activities
testY<-read.table("test/Y_test.txt",col.names="activities")        ##test activities
trainY<-read.table("train/Y_train.txt",col.names="activities")     ##train activities
##Read in subject ids
testSubjects<-read.table("test/subject_test.txt",col.names="ids")      ##test subject ids
trainSubjects<-read.table("train/subject_train.txt",col.names="ids")   ##train subject ids
##Read in activity labels
activ<-read.table("activity_labels.txt")




##combine test and training datasets testX+trainX
result<-rbind(testX,trainX)
##combine subject ids
resultsSubjects<-rbind(testSubjects,trainSubjects)
##combine activities
resultsY<-rbind(testY,trainY)


#find measurements to save
saveMeasurement<-grep("mean[^F]|std",colnames(result))     ##means
result<-result[,saveMeasurement]
#colnames(result[, grep("std",colnames(result))])
#nam[grep("std()",nam[,2]),]

##combine results with activities and subjects
result<-cbind(resultsSubjects,resultsY,result)

##add activity names
result<-mutate(result,activities=activ[activities,2])