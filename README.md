
## Assignment 4 

# This file explain how the code run_analysys works

library(reshape2)

# First read the activity and feactures files, which will use later.

act_labs<-read.table("activity_labels.txt")
colnames(act_labs)<- c("id", "label")
feac <- read.table("features.txt")

# Open train sets: subject file, activities file and feactures for train set. Finally merge all in one data frame linking id subject with id activity and linking code activity with activity 

#train sets

sub_train<- read.table("subject_train.txt")
colnames(sub_train)<-c("subject")
y_train<- read.table("y_train.txt")
colnames(y_train)<- c("id")
x_train<- read.table("X_train.txt")
colnames(x_train)<- feac[,2]
activity <- act_labs$label[match(y_train$id, act_labs$id)]
sub_train<- cbind(sub_train, activity, x_train)

# Open test sets: subject file, activities file and feactures for test set. Finally merge all in one data frame linking id subject with id activity and linking code activity with activity 


#test sets

sub_test<- read.table("subject_test.txt")
colnames(sub_test)<-c("subject")
x_test<- read.table("X_test.txt")
colnames(x_test)<- feac[,2]
y_test<- read.table("y_test.txt")
colnames(y_test)<- c("id")
activity <- act_labs$label[match(y_test$id, act_labs$id)]
sub_test<- cbind(sub_test, activity, x_test)

# Combine by row both sets creating a dataframe with 10299 rows and 563 columns (561 variables +  subject id + activity)

#total file

total_file <- rbind(sub_train, sub_test) 

# Choose subject, activity and all mean and std feactures

#Only mean and std file

total_file21<- total_file[,1:2]
rec<- grep("[Mm]ean|[Ss]td", colnames(total_file))
total_file22<- total_file[,rec]
total_file2<- cbind(total_file21, total_file22)

# Create the final tidy data generating average features by subject and activity. This is the file you can fine in the repo

#Tidy data

total_mest <- melt(total_file2, id = c("subject", "activity"))
final_data <- dcast(total_mest, subject + activity ~ variable, mean)
write.table(final_data, "tidydata.txt", sep=";")

