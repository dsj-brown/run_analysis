# run_analysis
Data Science, Getting and Cleaning Data Week 4 Assignment

This ReadMe contains descriptions of the how all the scripts work and how they are connected.

### Pre-requisites
This code is designed to tidy a set of files in the folder 'UCI HAR Dataset' supplied as part of the assignment.
See: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

If you would like to re-run this script then please ensure the file is saved in a location adjacent to this project (i.e. as a peer in the folder structure, not above or below).

Please ensure the following libraries are loaded before running:
1. data.table
2. dplyr

## Scripts

### run_analysis(writeFile = FALSE)
A function which executes a series of nested functions and results in a tidy data set being returned to the global environment.
If you would like to write the contents of the data set into a .txt file, contained in the project folder, then specify the argument writeFile = TRUE when executing the function. 

The function calls the following functions in order:
1. importData()
2. mergeData()
3. totalData()

### importData()
A function to import the relevant files from your working directory.  
It assumes the files are contained in a sub folder called 'UCI HAR Dataset' and stored in a manner identical to the folder made available for for the project.  The folder must be a peer of this project directory.

It creates the following data frames which are needed to perform the subsequent merge:
1. dTest: contains the content of 'X_test.txt' (the test observations)
2. aTrain: contains the content of 'y_test.txt' (the activity ids for each observation in X_test.txt) 
3. dTrain: contains the content of 'X_train.txt'
4. aTrain: contains the content of 'y_train.txt' (the activity ids for each observation in X_train.txt) 
5. dLabels: contains the contents of 'features.txt' (the field names for the test and train datasets)
6. dActs: contains the contents of 'activity_labels.txt' (the descriptive labels for each unique activity id presented in y_test.txt and y_train.txt)

### mergeData()
A function which produces the data frame: dCombine.

A complete data set of labelled observations, containing only those variables which relate to mean or standard deviation measurements

The steps followed to populate the data set are as follows:

1. Add activity labels to dTest.
2. Add activity labels to dTrain.
3. Join data frames dTest and dTrain. Call it dAllData.
4. Create a list of field names made up of:
    + the name 'actId'; plus
    + the contents of dLabels
5. Add the list of field names to dAllData.
6. Rename fields in dActs to 'actId' and 'activityName'.
7. Merge dActs with dAllData.
8. Create a subset of field names which contain the following:
    + [Mm]ean; or
    + std
9. Create a list made up of 'activityName' and the subset of fields derived under step 8.
10. Select the fields in dAllData using the combined field list from step 9.  Assign to object dSelData.
11. Assign the value of dSelData to a global object: **dCombine**
12. Delete all objects used in this sequence from the global environment.

### totalData()
A data set containing the average of each variable for each activity and each subject.

The steps followed to populate the data set are as follows:
1. Group dCombine by activityName.  Store as object: groupData
2. Generate a mean of each variable, by group.  Store as object: meanData
3. Transpose the data so it is presented as tall and thin as opposed to short and fat. Store as object: tallData
4. Convert the signal measures (former column headings) to be the first column of tallData, as opposed to mere row labels.
5. Provide the first column of tallData with a descriptive name: signalMeasures
6. Assign the value of tallData to a global object: **dTotals**
7. Delete the object dCombine from the global environment.