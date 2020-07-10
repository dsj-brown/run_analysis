# CodeBook for dTotals

## Data transformations

The data contained in the data frame **dTotals**, as produced by the **run_analysis()** function, has been combined, merged, grouped and summarised, but no data cleansing has been necessary due to the high quality raw data.

The README.md file explains the steps taken to transform the raw data.

## Data report overview
The dataset examined has the following dimensions:


Feature                 |  Result
----------------------- | -------
Number of observations  |      86
Number of variables     |       7


### Codebook summary table


Variable                   | Class     | # unique | Missing | Description  
                           |           |          | values  |                      
-------------------------- | --------- | -------- | ------- | ----------------
**signalMeasure**          | character |       86 |  0.00 % |               
**LAYING**                 | numeric   |       84 |  0.00 % |   
**SITTING**                | numeric   |       84 |  0.00 % |                
**STANDING**               | numeric   |       84 |  0.00 % |                
**WALKING**                | numeric   |       84 |  0.00 % |                
**WALKING\_DOWNSTAIRS**    | numeric   |       84 |  0.00 % |                
**WALKING\_UPSTAIRS**      | numeric   |       84 |  0.00 % |                

The name of the mean or standard deviation signal measure for which the mean has been derived for all subsequent variables.

### Variable list
#### signalMeasure

* The variable is a key (distinct values for each observation).

\fullline

#### LAYING

\bminione

----------------------------------------
Feature                           Result
------------------------- --------------
Variable type                    numeric

Number of missing obs.           0 (0 %)

Number of unique values               84

Median                             -0.94

1st and 3rd quartiles       -0.97; -0.02

Min. and max.                -0.98; 0.62
----------------------------------------

\emini
\bminitwo
\emini
\fullline

#### SITTING

\bminione

----------------------------------------
Feature                           Result
------------------------- --------------
Variable type                    numeric

Number of missing obs.           0 (0 %)

Number of unique values               84

Median                             -0.95

1st and 3rd quartiles       -0.98; -0.02

Min. and max.                -0.99; 0.88
----------------------------------------

\emini
\bminitwo
\emini
\fullline

#### STANDING

\bminione

----------------------------------------
Feature                           Result
------------------------- --------------
Variable type                    numeric

Number of missing obs.           0 (0 %)

Number of unique values               84

Median                             -0.94

1st and 3rd quartiles       -0.97; -0.03

Min. and max.                -0.99; 0.94
----------------------------------------

\emini
\bminitwo
\emini
\fullline

#### WALKING

\bminione

----------------------------------------
Feature                           Result
------------------------- --------------
Variable type                    numeric

Number of missing obs.           0 (0 %)

Number of unique values               84

Median                             -0.25

1st and 3rd quartiles       -0.37; -0.04

Min. and max.                -0.98; 0.93
----------------------------------------

\emini
\bminitwo
\emini
\fullline

#### WALKING\_DOWNSTAIRS

\bminione

---------------------------------------
Feature                          Result
------------------------- -------------
Variable type                   numeric

Number of missing obs.          0 (0 %)

Number of unique values              84

Median                            -0.08

1st and 3rd quartiles       -0.32; 0.02

Min. and max.               -0.95; 0.93
---------------------------------------

\emini
\bminitwo
\emini
\fullline

#### WALKING\_UPSTAIRS

\bminione

---------------------------------------
Feature                          Result
------------------------- -------------
Variable type                   numeric

Number of missing obs.          0 (0 %)

Number of unique values              84

Median                            -0.29

1st and 3rd quartiles       -0.42; -0.1

Min. and max.               -0.95; 0.88
---------------------------------------


\emini
\bminitwo
\emini
\fullline

Report generation information:

 *  Report creation time: Fri Jul 10 2020 01:10:36

 *  R version 4.0.0 (2020-04-24).

 *  Platform: x86_64-w64-mingw32/x64 (64-bit)(Windows 10 x64 (build 18362)).