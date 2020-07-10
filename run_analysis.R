# Load the dependent libraries
library(data.table)
library(dplyr)
library(tidyr)

## -------------------------------------------------------------
## FUNCTION: run_analysis()
## Function which runs the following scripts, outlined below
## 1. importData()
## 2. mergeData()
## 3. totalData()
## The product of which is a tidy data set called dTotals
##
## Pass argument writeFile = TRUE if you'd like to generate a
## .txt file containing the contents of the data set
##
## PRE-REQUISITES:
## 1. Folder 'UCI HAR Dataset' must be a peer of the project folder
## 2. Please ensure the following libraries are loaded:
##      library(data.table)
##      library(dplyr)
##      library(tidyr)
## -------------------------------------------------------------

run_analysis <- function(writeFile = FALSE){
        importData()
        mergeData()
        totalData()

        # Print the file if instructed
        if (writeFile == TRUE) {
                write.table(dTotals, file = "dTotals.txt", row.name = FALSE)
                message(paste("File 'dTotals.txt' written to", getwd()))
        }
}

## -------------------------------------------------------------
## FUNCTION: importData()
## Function to import run analysis data
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

        # Read in the test activity labels and assign to an object 
        # in the global environment        
        aTest <<- read.table("test/y_test.txt", header = FALSE, 
                             comment.char = "")
        
        # Read in the train dataset and assign to an object 
        # in the global environment        
        dTrain <<- read.table("train/X_train.txt", header = FALSE, dec = ".", 
                            comment.char = "", colClasses = "numeric")
        
        # Read in the train activity labels and assign to an object 
        # in the global environment
        aTrain <<- read.table("train/y_train.txt", header = FALSE, 
                              comment.char = "")
        
        # Read in the variable labels and assign to an object 
        # in the global environment
        dLabels <<- read.table("features.txt", header = FALSE, comment.char = "")

        # Read in the activity names and assign to an object 
        # in the global environment
        dActs <<- read.table("activity_labels.txt", header = FALSE, comment.char = "")
        
        # Revert working directory to the project folder
        setwd(vWd)

}

## -------------------------------------------------------------
## FUNCTION: mergeData()
## Function to merge the training and test sets 
## to create one data set
## Ensure the tidyr and dplyr libraries have been loaded before 
## executing
## -------------------------------------------------------------

mergeData <- function() {
        
        # Turn off warnings
        oldw <- getOption("warn")
        options(warn = -1)
        
        # Add subject fields
        dTest$subject <- "test"
        dTrain$subject <- "train"
        
        # Incorporate the activity labels
        dTest <- cbind(aTest, dTest)
        dTrain <- cbind(aTrain, dTrain)
        
        ## Join the two tables
        dAllData <- rbind(dTest, dTrain)
        
        ## Combine a list of field labels and add to combined dataset
        vNames <- c("actId", dLabels[, 2], "subject")
        names(dAllData) = vNames
        
        # Prepare the activity labels
        dActs <- rename(dActs, actId = V1, activityName = V2)
        # Merge the activity name in
        dAllData <- merge(dAllData, dActs, by.x = "actId", 
                        by.y = "actId", all = TRUE)
        
        # Define the subset of field names that we care about
        fList <- grep("[Mm]ean|std", names(dAllData), value = TRUE)
        fList <- c("subject", "activityName", fList)
        
        # Then select only the fields that we need
        dSelData <- select(dAllData, fList)
        
        # Tidy the data
        dTallData <- gather(dSelData, "signalMeasure", "value", 
                            -subject, -activityName)
        
        ## Return the results to the global environment 
        dCombine <<- dTallData
        
        # Tidy up the global objects that were used in this function
        rm(dTest, envir = .GlobalEnv)
        rm(dTrain, envir = .GlobalEnv)      
        rm(dLabels, envir = .GlobalEnv)
        rm(dActs, envir = .GlobalEnv)
        rm(aTest, envir = .GlobalEnv)
        rm(aTrain, envir = .GlobalEnv)

        # Turn warnings back on
        options(warn = oldw)

}

## -------------------------------------------------------------
## FUNCTION: totalData()
## Function to produce a tidy data set which contains
## mean values for all variables in dCombine, by activity type.
## After grouping there are more variables than there are 
## activities, so the data set is transposed to produce a 
## tall and thin data set.
## Ensure the data.table library is loaded before executing.
## -------------------------------------------------------------

totalData <- function(){
        
        # Group and summarize the dCombine dataset by subject and activityName
        grpData <- dCombine %>% 
                group_by(subject, activityName, signalMeasure) %>%
                summarise(value = mean(value))

        # Assign the result to a global variable
        dTotals <<- grpData
        
        # Dispose of the dCombine data frame
        rm(dCombine, envir = .GlobalEnv)
        
}
