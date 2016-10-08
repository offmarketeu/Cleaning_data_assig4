setwd("E:/COURSERA/Data Science/Course3- Getting and cleaning data/Week_4/Assignment_4/analisis")
library(reshape2)

act_labs<-read.table("activity_labels.txt")
colnames(act_labs)<- c("id", "label")
feac <- read.table("features.txt")

#train sets

sub_train<- read.table("subject_train.txt")
colnames(sub_train)<-c("subject")
y_train<- read.table("y_train.txt")
colnames(y_train)<- c("id")
x_train<- read.table("X_train.txt")
colnames(x_train)<- feac[,2]
activity <- act_labs$label[match(y_train$id, act_labs$id)]
sub_train<- cbind(sub_train, activity, x_train)


#test sets

sub_test<- read.table("subject_test.txt")
colnames(sub_test)<-c("subject")
x_test<- read.table("X_test.txt")
colnames(x_test)<- feac[,2]
y_test<- read.table("y_test.txt")
colnames(y_test)<- c("id")
activity <- act_labs$label[match(y_test$id, act_labs$id)]
sub_test<- cbind(sub_test, activity, x_test)

# total file - merge test and train sets 

total_file <- rbind(sub_train, sub_test) 
#write.table(total_file, "tidydata.txt", row.name=FALSE sep=";")

# extract only mean() and std() variables
# if you want to extract all mean variables then substitute
# by rec<- grep("[Mm]ean|[Ss]td", names(total_file))

total_file21<- total_file[,1:2]
rec<- grep("mean\\(|std\\(", names(total_file))
total_file22<- total_file[,rec]
total_file2<- cbind(total_file21, total_file22)

# Change variable names

colnames(total_file2) <- sub("-mean", "Mean", names(total_file2))
colnames(total_file2) <- sub("-std", "Std", names(total_file2))
colnames(total_file2) <- sub("\\()-", "", names(total_file2))
colnames(total_file2) <- sub("\\()", "", names(total_file2))





# Step 5 -final 

total_mest <- melt(total_file2, id = c("subject", "activity"))
final_data <- dcast(total_mest, subject + activity ~ variable, mean)
write.table(final_data, "tidydata.txt", sep=";")

