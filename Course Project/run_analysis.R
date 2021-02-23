#Upload the libraries
library(dplyr)
library(reshape2)

#Setting the WD
#It's called CP as in Course Project
setwd("C:/Users/Usuario1/Dropbox/Data Science")
if(!file.exists("CP")){
  dir.create("CP")}

#Downloading the file
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "./CP/samsung.zip")

#Unzipping and checking
unzip("./CP/samsung.zip", exdir="./CP")
list.files("./CP")

#This is the actual folder where the data was sent
setwd("C:/Users/Usuario1/Dropbox/Data Science/CP/UCI HAR Dataset")
#See files
list.files(getwd())

#File Reading
#Training
s_train <- read.table(paste(sep = "", "./train/subject_train.txt"))
x_train <- read.table(paste(sep = "", "./train/X_train.txt"))
y_train <- read.table(paste(sep = "", "./train/Y_train.txt"))

#Test
s_test <- read.table(paste(sep = "", "./test/subject_test.txt"))
x_test <- read.table(paste(sep = "", "./test/X_test.txt"))
y_test <- read.table(paste(sep = "", "./test/Y_test.txt"))

#Binding
s_data <- rbind(s_train, s_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

#Extracting variable names and activites
features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

#Extracting only means and std from variable names
selectedCols<- grep("-(mean|std).*", features[,2])
selectedColNames <- features[selectedCols, 2]

#Changing to proper names
selectedColNames <- gsub("-mean", "Mean", selectedColNames)
selectedColNames <- gsub("-std", "Std", selectedColNames)
selectedColNames <- gsub("[-()]", "", selectedColNames)
selectedColNames 


#Selecting only the columns in the data with mean and STD
x_data <- x_data[selectedCols]

#Binding all the columns
alldata <- cbind(s_data, y_data, x_data)

#Changing names to the columns
colnames(alldata) <- c("Subject", "Activity", selectedColNames)
str(alldata)

#Replacing y labels with activity names
labels = activities[,2]
alldata$Activity <- factor(alldata$Activity, levels= activities[,1],
                              labels = labels)

#Defining subjects as factors
alldata$Subject <- as.factor(alldata$Subject)


#checking the data
str(alldata)
View(alldata)

#Generating a new tidy data set with mean per individuals and activity
meltedData <- melt(alldata, id = c("Subject", "Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)
write.table(tidyData, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)
