# testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
# testActivities<-read.table("UCI HAR Dataset/test/y_test.txt", header = F)
# testReadings<-read.table("UCI HAR Dataset/test/x_test.txt", header = F)
# 
# trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt", header = F)
# trainActivities<-read.table("UCI HAR Dataset/train/y_train.txt", header = F)
# trainReadings<-read.table("UCI HAR Dataset/train/x_train.txt", header = F)
# 
# readingNames<-read.table("UCI HAR Dataset/features.txt", header = F)
# activityNames<-read.table("UCI HAR Dataset/activity_labels.txt", header = F)

testSubjects<-read.table("~/downloads/UCI HAR Dataset/test/subject_test.txt", header = F)
testActivities<-read.table("~/downloads/UCI HAR Dataset/test/y_test.txt", header = F)
testReadings<-read.table("~/downloads/UCI HAR Dataset/test/x_test.txt", header = F)

trainSubjects<-read.table("~/downloads/UCI HAR Dataset/train/subject_train.txt", header = F)
trainActivities<-read.table("~/downloads/UCI HAR Dataset/train/y_train.txt", header = F)
trainReadings<-read.table("~/downloads/UCI HAR Dataset/train/x_train.txt", header = F)

readingNames<-read.table("~/downloads/UCI HAR Dataset/features.txt", header = F)
activityNames<-read.table("~/downloads/UCI HAR Dataset/activity_labels.txt", header = F)

allSubjects<-rbind(testSubjects,trainSubjects)
allActivities<-rbind(testActivities,trainActivities)
allReadings<-rbind(testReadings,trainReadings)

names(allSubjects)<-"subject"
names(allActivities)<-"activity"
names(allReadings)<-readingNames[,2]

allData<-cbind(allSubjects, allActivities, allReadings)

allData$activity<-as.character(allData$activity)
allData$activity[allData$activity=="1"]<-"walking"
allData$activity[allData$activity=="2"]<-"walkingUpStairs"
allData$activity[allData$activity=="3"]<-"walkingDownStairs"
allData$activity[allData$activity=="4"]<-"sitting"
allData$activity[allData$activity=="5"]<-"standing"
allData$activity[allData$activity=="6"]<-"laying"
allData$activity<-as.factor(allData$activity)

interestingData <-cbind(allData[,1:8],allData[,43:48],allData[,83:88],allData[,123:128],allData[,163:168],
                        allData[,203:204],allData[,216:217],allData[,229:230],allData[,255:256])
interestingNames<-c("subject","activity",
                    "bodyAccXMean","bodyAccYMean","bodyAccZMean",
                    "bodyAccXSTD","bodyAccYSTD","bodyAccZSTD",
                    "gravityAccXMean","gravityAccYMean","gravityAccZMean",
                    "gravityAccXSTD","gravityAccYSTD","gravityAccZSTD",
                    "bodyAccJerkXMean","bodyAccJerkYMean","bodyAccJerkZMean",
                    "bodyAccJerkXSTD","bodyAccJerkYSTD","bodyAccJerkZMSTD",
                    "bodyGyroXMean","bodyGyroYMean","bodyGyroZMean",
                    "bodyGyroXSTD","bodyGyroYSTD","bodyGyroZSTD",
                    "bodyGyroJerkXMean","bodyGyroJerkYMean","bodyGyroJerkZMean",
                    "bodyGyroJerkXSTD","bodyGyroJerkYSTD","bodyGyroJerkZSTD",
                    "bodyAccMagMean", "bodyAccMagSTD", 
                    "gravityAccMagMean", "gravityAccMagSTD",
                    "bodyAccJerkMagMean", "bodyAccJerkMagSTD",
                    "bodyGyroJerkMagMean", "bodyGyroJerkMagSTD")
names(interestingData)<-interestingNames
exportData<-ddply(interestingData, .(subject,activity), summarise, 
                    mean(interestingData[,3]), mean(interestingData[,4]), mean(interestingData[,5]),
                    mean(interestingData[,6]), mean(interestingData[,7]), mean(interestingData[,8]),
                    mean(interestingData[,9]), mean(interestingData[,10]), mean(interestingData[,11]),
                    mean(interestingData[,12]), mean(interestingData[,13]), mean(interestingData[,14]),
                    mean(interestingData[,15]), mean(interestingData[,16]), mean(interestingData[,17]),
                    mean(interestingData[,18]), mean(interestingData[,19]), mean(interestingData[,20]),
                    mean(interestingData[,21]), mean(interestingData[,22]), mean(interestingData[,23]),
                    mean(interestingData[,24]), mean(interestingData[,25]), mean(interestingData[,26]),
                    mean(interestingData[,27]), mean(interestingData[,28]), mean(interestingData[,29]),
                    mean(interestingData[,30]), mean(interestingData[,31]), mean(interestingData[,32]),
                    mean(interestingData[,33]), mean(interestingData[,34]),
                    mean(interestingData[,35]), mean(interestingData[,36]),
                    mean(interestingData[,37]), mean(interestingData[,38]),
                    mean(interestingData[,39]), mean(interestingData[,40]))
names(exportData)<-interestingNames

write.table(exportData, "exportedDataset.txt",row.name=FALSE)

