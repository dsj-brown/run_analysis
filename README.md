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
3. tidyr

## Scripts

### run_analysis(writeFile = FALSE)
A function which executes a series of nested functions and results in a tidy data set being returned to the global environment.

If you would like to write the contents of the data set into a .txt file, contained in the project folder, then specify the argument writeFile = TRUE when executing the function. 

The function calls the following functions in order:
1. importData()
2. mergeData()
3. totalData()

### importData()
A function to import the assignment data files.

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

1. Add subject field to dTest.
2. Add subject field to dTrain. 
3. Add activity labels to dTest.
4. Add activity labels to dTrain.
5. Join data frames dTest and dTrain. Assign to object: dAllData.
6. Create a list of field names(assigned to object: vNames) made up of:
    + the name 'actId'; plus
    + the contents of dLabels
    + the name 'subject'
7. Apply list of field names to dAllData.
8. Rename fields in dActs to 'actId' and 'activityName'.
9. Merge dActs with dAllData.
10. Create a subset of field names (assign to object: fList) which contains the following:
    + [Mm]ean; or
    + std
11. Extend fList to include 'subject', 'activityName' and the subset of fields derived under step 10.
12. Select the required fields from dAllData using the combined field list from step 11.  Assign to object: dSelData.
13. Tidy dSelData, coercing variable names into a new field 'signalMeasure', and the observation value into a new field 'value'.  Assign to object: tallData.
14. Assign the value of tallData to a global object: **dCombine**
15. Delete all objects used in this sequence from the global environment.

### totalData()
A data set containing the average of each variable for each activity and each subject.

The steps followed to populate the data set are as follows:
1. Group dCombine by subject, activityName and signalMeasure.  Assign to object: grpData
2. Summarise groupData to return the mean for each group of observed values.
3. Assign the value of grpData to a global object: **dTotals**
4. Delete the object dCombine from the global environment.