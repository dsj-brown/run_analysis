## -------------------------------------------------------------
## importData()
## Function to import run analysis data
## Folder 'UCI HAR Dataset' must be a peer of the project folder
## -------------------------------------------------------------

importData <- function() {
        # Remember current working directory (project folder)
        vWd = getwd()
        # Skip up a level
        setwd("..")
        # Drop down into the folder containing the datasets
        setwd("./UCI HAR Dataset")
        
        # Read in the test dataset and assign to an object 
        # in the global environment
        dTest <<- read.table("test/X_test.txt", header = FALSE, dec = ".", 
                            comment.char = "", colClasses = "numeric")
        
        # Read in the train dataset and assign to an object 
        # in the global environment        
        dTrain <<- read.table("train/X_train.txt", header = FALSE, dec = ".", 
                            comment.char = "", colClasses = "numeric")
        
        # Read in the variable labels and assign to an object 
        # in the global environment
        dLabels <<- read.table("features.txt", header = FALSE, comment.char = "")

        # Revert working directory to the project folder
        setwd(vWd)

}

## --------------------------------------------
## mergeData()
## Function to merge the training and test sets 
## to create one data set
## --------------------------------------------

mergeData <- function() {
        
        ## Join the two tables
        dAllData <- rbind(dTest, dTrain)
        ## Add variable labels using the dLabels object
        names(dAllData) = dLabels[ ,2]
        ## Return the results to the global environment 
        dCombine <<- dAllData
        # Tidy up the global objects that were used in this function
        rm(dTest, envir = .GlobalEnv)
        rm(dTrain, envir = .GlobalEnv)      
        rm(dLabels, envir = .GlobalEnv)  

}

# Set labels on the test and train datasets
names(dTest) = dLabels[ ,2]
names(dTrain) = dLabels[ ,2]