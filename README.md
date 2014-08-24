The run-analysis.R file is used to clean up the provided data.

Firstly, the file is download from the url. After the files are unzipped and plcaed in Current Working Directory, the data extraction step begins.

During the data extraction process, the Input Training Set & Input Testing Set are extracted.

These sets of inputs are merged with the rbind command.

Next, we extract the Mean & Standard Deviation measurements by using the grepl function on all the column names of the combined input. This subsetted chunk of data will be column-binded to the output later on!



