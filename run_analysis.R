setwd("E:/COURSERA/Data Science/Course3- Getting and cleaning data/Week_4/Assignment_4/analisis")


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
y_train$id <- act_labs$label[match(y_train$id, act_labs$id)]
sub_train<- cbind(sub_train, y_train, x_train)



#test sets

sub_test<- read.table("subject_test.txt")
colnames(sub_test)<-c("subject")
x_test<- read.table("X_test.txt")
colnames(x_test)<- feac[,2]
y_test<- read.table("y_test.txt")
colnames(y_test)<- c("id")
y_test$id <- act_labs$label[match(y_test$id, act_labs$id)]
sub_test<- cbind(sub_test, y_test, x_test)




# total file

total_file <- rbind(sub_train, sub_test) 
write.table(total_file, "tidydata.txt")

#Only mean and std

rec<- grep("[Mm]ean|[Ss]td", colnames(total_file))
total_file2<- total_file[,rec]
write.table(total_file2, "tidydata2.txt")
str(total_file2)

