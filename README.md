#README

##Description of files

- data/ (not present in repository): data files available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- run_analysis.R: extracts, merges, and processes the data
- CodeBook.md: description of variables
- first.txt: First R data frame with all means and standard deviation data
- second.txt: Second R data frame with means of means and standard deviations for each subject/activity combination

##Explanation of analysis

Data files for X, Y, and subject data were read in from both test and train sets and then combined to make single data sets for each type of data. The X feature names were derived from the original feature names but with single or multiple special characters such as parenthesis, dashes, and commas replaced with a single period and with any terminal periods removed. Activity names were merged into the Y data sets. The X, Y, and subject data was then combined into a single data set and unwanted columns were removed.  For the second data set, the means for all X data were found for each combination of subject and activity.
