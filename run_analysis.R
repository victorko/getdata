


#### Constants

DATA_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
DATA_FOLDER_PATH <- "./data"
DO_DOWNLOAD <- FALSE


#### Main script function

runAnalysis <- function () {
    
    # download data
    if (DO_DOWNLOAD) {
        message("Downloading and unpacking data")
        downloadData(DATA_URL, DATA_FOLDER_PATH)
    }
    
    # get feature names and numbers table
    features <- getFeatureNamesAndNumbers(DATA_FOLDER_PATH)
    
    # get activities namse and numbers table
    activities <- getActivityNamesAndNumbers(DATA_FOLDER_PATH)
    
    # read test data set
    message("Reading test data set")
    testDataSet <- readDataSet(paste(DATA_FOLDER_PATH, "UCI HAR Dataset/test/X_test.txt", sep = "/"), 
                               features,
                               paste(DATA_FOLDER_PATH, "UCI HAR Dataset/test/y_test.txt", sep = "/"),
                               activities,
                               paste(DATA_FOLDER_PATH, "UCI HAR Dataset/test/subject_test.txt", sep = "/"))
    
    # read train data set
    message("Reading train data set")
    trainDataSet <- readDataSet(paste(DATA_FOLDER_PATH, "UCI HAR Dataset/train/X_train.txt", sep = "/"), 
                                features,
                                paste(DATA_FOLDER_PATH, "UCI HAR Dataset/train/y_train.txt", sep = "/"),
                                activities,
                                paste(DATA_FOLDER_PATH, "UCI HAR Dataset/train/subject_train.txt", sep = "/"))
    
    # merge test and train data
    message("Merging data")
    dataSet <- rbind(testDataSet, trainDataSet)
    
    # get tidy data set
    message("Processing merged data")
    tidyDataSet <- aggregate(. ~ subject + activity, dataSet, mean)
    
    # save tidy data set
    message("Saving the result")
    outputPath <- paste(DATA_FOLDER_PATH, "data.csv", sep = "/")
    write.table(tidyDataSet, file = outputPath, sep = ",")
}



#### Helper functions

## Download and unpack data
downloadData <- function (url, dataFolderPath) {
    
    # delete and recreate data folder
    unlink(dataFolderPath, recursive = TRUE, force = TRUE)
    dir.create(dataFolderPath)
    
    # download the archive
    archivePath <- paste(dataFolderPath, "data.zip", sep = "/")
    download.file(url, destfile = archivePath, quiet = TRUE)
    
    # unzip the archive
    unzip(archivePath, exdir = dataFolderPath)
    
    # delete archive
    unlink(archivePath, force = TRUE)
}

# Get feature names and numbers table we interested in
getFeatureNamesAndNumbers <- function (dataFolderPath) {
    
    # read features.txt file
    featuresFilePath <- paste(dataFolderPath, "UCI HAR Dataset/features.txt", sep = "/")
    features <- read.table(featuresFilePath, col.names = c("number", "name"))
    
    # filter features
    features <- features[grep("-mean\\(\\)|-std\\(\\)", features$name), ]
    
    # reformat feature names
    features$name <- gsub("-mean\\(\\)", ".mean", features$name)
    features$name <- gsub("-std\\(\\)", ".std", features$name)
    features$name <- gsub("-X", ".x", features$name)
    features$name <- gsub("-Y", ".y", features$name)
    features$name <- gsub("-Z", ".z", features$name)
    
    features
}

# Get activity names and numbers table
getActivityNamesAndNumbers <- function (dataFolderPath) {
    
    # read activity_labels.txt file
    activitiesFilePath <- paste(dataFolderPath, "UCI HAR Dataset/activity_labels.txt", sep = "/")
    read.table(activitiesFilePath, col.names = c("number", "name"))    
}

# Read data set
readDataSet <- function (featuresDataFilePath, featureNames,
                         activitiesDataFilePath, activityNames,
                         subjectsDataFilePath) {
    
    # read features data from file
    featuresData <- read.table(featuresDataFilePath)
    
    # filter out unnecessary feature columns
    featuresData <- featuresData[, featureNames$number]
    
    # set feature column names
    colnames(featuresData) <- featureNames$name
    
    # read activities data from file
    activitiesData <- read.table(activitiesDataFilePath, col.names = c("number"))    
    
    # convert activities data table for using factor with readable levels
    activitiesData <- data.frame(activity = factor(activitiesData$number, labels = activityNames$name))
    
    # read subjects data from file
    subjectsData <- read.table(subjectsDataFilePath, col.names = c("subject"))
    
    # merge and return data
    cbind(subjectsData, activitiesData, featuresData)
}



#### Run script

runAnalysis()
