# run_analysis
Data Science, Getting and Cleaning Data Week 4 Assignment

This ReadMe contains descriptions of the how all the scripts work and how they are connected.

## Scripts
### importData()
A function to import the relevant files from your working directory.  
It assumes the files are contained in a sub folder called 'UCI HAR Dataset' and stored in a manner identical to the folder downloaded for the project.  
It creates three data frames:
1. dTest: contains the content of 'X_test.txt'
2. dTrain: contains the content of 'X-train.txt'
3. dLabels: contains the contents of 'features.txt'

### mergeData()
A function which merges the dTest and dTrain datasets into a new combined data frame.  Variable labels are applied, using the content of dLabels, then all variables are removed, other than those containing mean or standard deviation measures.

