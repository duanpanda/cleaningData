# Getting and Cleaning Data Course Project

This project contains one R script, `run_analysis.R`, which will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0 [1]. This dataset should be [downloaded](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracted directly into the data directory.

Once executed, the resulting dataset maybe found at `./tidy_data.txt`

For futher details, refer to [CookBook.md](CookBook.md)

## Required R Packages

The R package `reshape2` is required to run this script. This maybe installed with,

```{r}
install.package("reshape2")
```
