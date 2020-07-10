# CodeBook for dTotals

## Data transformations

The data contained in the data frame **dTotals**, as produced by the **run_analysis()** function, has been combined, merged, grouped and summarised, but no data cleansing has been necessary due to the high quality of the raw data.

The dataset has been transposed so it is tall and thin as opposed to short and fat.

The README.md file explains all the steps taken to transform the raw data.

## Data report overview
The dataset examined has the following dimensions:

Feature                 |  Result
----------------------- | -------
Number of observations  |   15480
Number of variables     |       4


## Codebook summary table

Variable              | Class       |   # unique | Missing values
--------------------- | ----------- | ---------- | --------------
**subject**           | integer     |         30 |         0.00 %                
**activityName**      | character   |          6 |         0.00 %                
**signalMeasure**     | character   |         86 |         0.00 %                
**value**             | numeric     |      15120 |         0.00 % 


## Variable list

### subject

Provides an id relating to the subject to whom the associated observations relate.

Feature                   | Result
------------------------- | -------
Variable type             | integer
Number of missing obs.    | 0 (0 %)
Number of unique values   |      30
Median                    |    15.5
1st and 3rd quartiles     |   8; 23
Min. and max.             |   1; 30

### activityName

Describes the activity being undertaken by the subject when the observations were recorded.

Feature                   |    Result
------------------------- | ---------
Variable type             | character
Number of missing obs.    |   0 (0 %)
Number of unique values   |         6
Mode                      |  "LAYING"

### signalMeasure

Describes the the specific time and frequency domain variable that was measured.
Only the variables which presented a mean or standard deviation have been included in this dataset.

Feature                   |                                 Result
------------------------- | --------------------------------------
Variable type             |                              character
Number of missing obs.    |                                0 (0 %)
Number of unique values   |                                     86
Mode                      | "angle(tBodyAccJerkMean),gravityMean)"

### value

Is the summarised mean of all signalMeasure values for the indicated subject and activityName group.

Feature                   |       Result
------------------------- | ------------
Variable type             |      numeric
Number of missing obs.    |      0 (0 %)
Number of unique values   |        15120
Median                    |        -0.29
1st and 3rd quartiles     | -0.94; -0.02
Min. and max.             |     -1; 0.97


Report generation information:

*  Report creation time: Fri Jul 10 2020 11:37:47