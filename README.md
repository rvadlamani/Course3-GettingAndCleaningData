Course3-GettingAndCleaningData
==============================

Very important to install the reshape2 package for running this script

ex.install.packages("reshape2")

Make sure the script is copied to the main directory of the data. It loads the data data from "test" and "train" folders automatically.

Writes the output file in the current folder.

What Does the Script do:

- Checks if the "reshape2" is installed.

- if installed enables the library

- reads all the activites and the data features enabled

- read the test data and format the columns wiht the column names for both test and train data

- Attach the metadata for Activity and Subjects

- create a final data set with all the data

- Find all the Mean and StdDev data from the complete data sets

- merge all the attributes by Activity Id and Subject with respective data and with their correct column names

- Write the output form the data to set to text delimited file
