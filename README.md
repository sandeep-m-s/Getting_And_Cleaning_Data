The run-analysis.R file is used to clean up the provided data.

Firstly, the file is download from the url. After the files are unzipped and placed in the Current Working Directory, the data extraction step begins.

During the data extraction process, the Input Training Set & Input Testing Set are extracted.

These sets of inputs are merged with the rbind command.

Next, we extract the Mean & Standard Deviation measurements by using the grepl function on all the column names of the combined input. This subsetted chunk of data will be column-binded to the output later on!

Similar to the input set, now the Output Training Set & Output Testing Set are extracted.

These sets of outputs are merged with the rbind command.

Next, the activity labels files is loaded and the consolidated output variable is updated using the data in activity labels.

After this we perform cosmetic changes like labelling the data set aptly; that is, giving descriptive names.

Lastly, we create the tidy data containing the average of each variable for each activity & each subject. Now it is written to the output file "tidy_data.txt".