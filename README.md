# run_analysis
Data Science, Getting and Cleaning Data Week 4 Assignment

This ReadMe contains descriptions of the how all the scripts work and how they are connected.

## Scripts
### importData()
A function to import the relevant files from your working directory.  
It assumes the files are contained in a sub folder called 'UCI HAR Dataset' and stored in a manner identical to the folder downloaded for the project.  
It creates the following data frames which are needed to perform the subsequent merge:
1. dTest: contains the content of 'X_test.txt' (the test observations)
2. aTrain: contains the content of 'y_test.txt' (the activity ids for each observation in X_test.txt) 
3. dTrain: contains the content of 'X_train.txt'
4. aTrain: contains the content of 'y_train.txt' (the activity ids for each observation in X_train.txt) 
5. dLabels: contains the contents of 'features.txt' (the field names for the test and train datasets)
6. dActs: contains the contents of 'activity_labels.txt' (the descriptive labels for each unique activity id presented in y_test.txt and y_train.txt)

### mergeData()
A function which produces two data frames:
1. dCombine: a complete data set of labelled observations, containing only those variables which relate to mean or standard deviation measurements
2. dTotals: a data set containing the average of each variable for each activity and each subject.

The steps followed to populate each data set are as follows:

#### dCombine
1. Add activity labels to dTest.
2. Add activity labels to dTrain.
3. Join data frames dTest and dTrain. Call it dAllData.
4. Create a list of field names made up of:
        i) the name 'actId'; plus
        ii) the contents of dLabels
5. Add the list of field names to dAllData.
6. Rename fields in dActs to 'actId' and 'activityName'.
7. Merge dActs with dAllData.
8. Create a subset of field names which contain the following:
        i) [Mm]ean; or
        ii) std
9. Create a list made up of 'activityName' and the subset of fields derived under step 8.
10. Select the fields in dAllData using the combined field list from step 9.  Assign to object dSelData.
11. Assign the value of dSelData to a global variable: dCombine.
12. Delete all objects used in this sequence from the global environment.

#### dTotals
1. 