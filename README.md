# GaCD_CourseProject
## Course Project for Getting and Cleaning Data
The script `run_analysis.R` combines all the data from the testing and training data into one table `allData`. It ensures all the names of the variables ares maintained from the original data. 

A seperate table is then created containing all the subjects and activities but only the variables that were means and standard deviations from the original data. This table is named `interestingData`. 
It is then relabeled removing inappropriate characters and ensuring the names are descriptive.

Another table is created for export called `exportData` that contains the mean of each variable for each subject and activity. This table is then exported to `exportedDataset.txt.` 