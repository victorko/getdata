Human Activity Recognition Using Smartphones Tidy Data set
================================================================================================

This is a description for data set generated with ***run_analysis.R*** script in current repository.

This (tidy) data set is an aggregation from [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) which was a result of experiment series. The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity.

Tidy data set contains information about the measurements on the mean and standard deviation for each measurement. This information is aggregated by subjects of the experiment and activity type. It contains average values for all variables corresponding to each pair of subject and activity type. Variable values are normalized and bounded within [-1,1].

The tidy data set is provided in CSV format.

### Dataset columns

The data set contains the following columns.
* ***subject*** -- the number of a subject taking part of experiment;
* ***activity*** -- the activity type (one of the following values: *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*);
* variables representing mean and standard deviation of measurements done by accelerometer and gyroscope.

The features selected for this database come from the *accelerometer* and *gyroscope* 3-axial raw signals ***tAcc*** and ***tGyro***. These *time domain signals* (prefix ***t*** to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into *body* and *gravity* acceleration signals (***tBodyAcc*** and ***tGravityAcc***) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain *Jerk signals* (***tBodyAccJerk*** and ***tBodyGyroJerk***). Also the *magnitude* of these three-dimensional signals were calculated using the Euclidean norm (***tBodyAccMag***, ***tGravityAccMag***, ***tBodyAccJerkMag***, ***tBodyGyroMag***, ***tBodyGyroJerkMag***). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing ***fBodyAcc***, ***fBodyAccJerk***, ***fBodyGyro*** for 3-axial raw signals and for magnitude. (Note the ***f*** to indicate *frequency domain signals*). 

These signals were used to estimate variables of the feature vector for each pattern: ***.x***, ***.y*** and ***.z*** suffixes are used to denote 3-axial signals in the X, Y and Z directions.

For each of these features *mean* and *standard deviation* were estimated. Suffixes ***.mean*** and ***.std*** are used to denote this estimations.

Thus we have 66 variables representing the measurements: 
* ***tBodyAcc.mean.x***, ***tBodyAcc.mean.y***, ***tBodyAcc.mean.z***, ***tBodyAcc.std.x***, ***tBodyAcc.std.y***,  ***tBodyAcc.std.z***; 
* ***tGravityAcc.mean.x***, ***tGravityAcc.mean.y***, ***tGravityAcc.mean.z***, ***tGravityAcc.std.x***, ***tGravityAcc.std.y***, ***tGravityAcc.std.z***;
* ***tBodyAccJerk.mean.x***, ***tBodyAccJerk.mean.y***, ***tBodyAccJerk.mean.z***, ***tBodyAccJerk.std.x***, ***tBodyAccJerk.std.y***, ***tBodyAccJerk.std.z***;
* ***tBodyGyro.mean.x***, ***tBodyGyro.mean.y***, ***tBodyGyro.mean.z***, ***tBodyGyro.std.x***, ***tBodyGyro.std.y***, ***tBodyGyro.std.z***;
* ***tBodyGyroJerk.mean.x***, ***tBodyGyroJerk.mean.y***, ***tBodyGyroJerk.mean.z***, ***tBodyGyroJerk.std.x***, ***tBodyGyroJerk.std.y***, ***tBodyGyroJerk.std.z***;
* ***tBodyAccMag.mean***, ***tBodyAccMag.std***; 
* ***tGravityAccMag.mean***, ***tGravityAccMag.std***;
* ***tBodyAccJerkMag.mean***, ***tBodyAccJerkMag.std***;
* ***tBodyGyroMag.mean***, ***tBodyGyroMag.std***;
* ***tBodyGyroJerkMag.mean***, ***tBodyGyroJerkMag.std***;
* ***fBodyAcc.mean.x***, ***fBodyAcc.mean.y***, ***fBodyAcc.mean.z***, ***fBodyAcc.std.x***, ***fBodyAcc.std.y***, ***fBodyAcc.std.z***;
* ***fBodyAccJerk.mean.x***, ***fBodyAccJerk.mean.y***, ***fBodyAccJerk.mean.z***, ***fBodyAccJerk.std.x***, ***fBodyAccJerk.std.y***, ***fBodyAccJerk.std.z***;
* ***fBodyGyro.mean.x***, ***fBodyGyro.mean.y***, ***fBodyGyro.mean.z***, ***fBodyGyro.std.x***, ***fBodyGyro.std.y***, ***fBodyGyro.std.z***;
* ***fBodyAccMag.mean***, ***fBodyAccMag.std***;
* ***fBodyBodyAccJerkMag.mean***, ***fBodyBodyAccJerkMag.std***;
* ***fBodyBodyGyroMag.mean***, ***fBodyBodyGyroMag.std***;
* ***fBodyBodyGyroJerkMag.mean***, ***fBodyBodyGyroJerkMag.std***.