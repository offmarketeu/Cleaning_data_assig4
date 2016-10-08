Getting and Cleaning Data Assignment 4 Code book
==============================================================


## Original Data

There original data comes from the smartphone accelerometer and gyroscope 3-axial raw signals, 
which have been processed using various signal processing techniques to measurement vector consisting
of 561 features. For detailed description of the original dataset, please see `features_info.txt` in
the zipped dataset file.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Conventions followed



## Data sets

### Raw data set

The raw dataset was created merging train and test sets and previusly was adding the subject and the activity label.
That's create a data set of 10299 rows and 563 columns called 'total_file' 

From this data set we extract only mean() and std() variables selecting 66 features from the original data set.
Combined with subject identifiers `subject` and activity labels `activity`, this makes up the
68 variables of the processed raw data set call 'total_file2'.


### Tidy data set

Tidy data set contains the average of all feature standard deviation and mean values of the raw dataset. 
Original variable names were modified in the follonwing way:

 1. Replaced `-mean` with `Mean`
 2. Replaced `-std` with `Std`
 3. Removed parenthesis `-()`
 


#### Sample of renamed variables compared to original variable name

 Raw data            | Tidy data 
 --------------------|--------------
 `subject`           | `subject`
 `activity`          | `activity`
 `tBodyAcc-mean()-X` | `tBodyAccMeanX`
 `tBodyAcc-mean()-Y` | `tBodyAccMeanY`
 `tBodyAcc-mean()-Z` | `tBodyAccMeanZ`
 `tBodyAcc-std()-X`  | `tBodyAccStdX`
 `tBodyAcc-std()-Y`  | `tBodyAccStdY`
 `tBodyAcc-std()-Z`  | `tBodyAccStdZ`

