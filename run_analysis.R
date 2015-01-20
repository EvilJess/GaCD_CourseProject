# testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
# testActivities<-read.table("UCI HAR Dataset/test/y_test.txt", header = F)
# testReadings<-read.table("UCI HAR Dataset/test/x_test.txt", header = F)
# 
# trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt", header = F)
# trainActivities<-read.table("UCI HAR Dataset/train/y_train.txt", header = F)
# trainReadings<-read.table("UCI HAR Dataset/train/x_train.txt", header = F)

testSubjects<-read.table("~/downloads/UCI HAR Dataset/test/subject_test.txt", header = F)
testActivities<-read.table("~/downloads/UCI HAR Dataset/test/y_test.txt", header = F)
testReadings<-read.table("~/downloads/UCI HAR Dataset/test/x_test.txt", header = F)

trainSubjects<-read.table("~/downloads/UCI HAR Dataset/train/subject_train.txt", header = F)
trainActivities<-read.table("~/downloads/UCI HAR Dataset/train/y_train.txt", header = F)
trainReadings<-read.table("~/downloads/UCI HAR Dataset/train/x_train.txt", header = F)

readingNames<-read.table("~/downloads/UCI HAR Dataset/features.txt", header = F)

allSubjects<-rbind(testSubjects,trainSubjects)
allActivities<-rbind(testActivities,trainActivities)
allReadings<-rbind(testReadings,trainReadings)

names(allSubjects)<-"subject"
names(allActivities)<-"activity"
names(allReadings)<-readingNames[,2]

allData<-cbind(allSubjects, allActivities, allReadings)
