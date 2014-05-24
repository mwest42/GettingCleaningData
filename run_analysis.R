testdata <- read.table("test/X_test.txt")
traindata <- read.table("train/X_train.txt")

variablenames <- read.table("features.txt")

colnames(testdata) <- variablenames[,2]
colnames(traindata) <- variablenames[,2]

activitytest <- read.table("test/Y_test.txt")
activitytrain <- read.table("train/Y_train.txt")

testsubjects <- read.table("test/subject_test.txt")
trainsubjects <- read.table("train/subject_train.txt")

testdata <- cbind(testsubjects[,1],activitytest[,1],testdata)
colnames(testdata)[c(1,2)]<- c("subject","activity")
traindata <- cbind(trainsubjects[,1],activitytrain[,1],traindata)
colnames(traindata)[c(1,2)]<- c("subject","activity")

alldata <- rbind(testdata,traindata)

names(alldata)<- gsub("\\-","",names(alldata))
names(alldata)<- gsub("\\()","",names(alldata))

meascolumns <- c("tBodyAccmeanX", "tBodyAccstdX", "tBodyAccmeanY", "tBodyAccstdY", "tBodyAccmeanZ", "tBodyAccstdZ", "tGravityAccmeanX", "tGravityAccstdX", "tGravityAccmeanY", "tGravityAccstdY","tGravityAccmeanZ", "tGravityAccstdZ", "tBodyGyromeanX", "tBodyGyrostdX", "tBodyGyromeanY", "tBodyGyrostdY", "tBodyGyromeanZ", "tBodyGyrostdZ")

library(plyr)
summarytable <- ddply(alldata, c("subject","activity"),function(x) colMeans(x[,colnames(alldata)%in%meascolumns]))

summarytable$activity[summarytable$activity == 1]<- "walking"
summarytable$activity[summarytable$activity == 2]<- "walking_upstairs"
summarytable$activity[summarytable$activity == 3]<- "walking_downstairs"
summarytable$activity[summarytable$activity == 4]<- "sitting"
summarytable$activity[summarytable$activity == 5]<- "standing"
summarytable$activity[summarytable$activity == 6]<- "laying"

names(summarytable) <- tolower(names(summarytable))

write.table(summarytable,"summarytable.txt")
