The following README explains the analysis performed for the Course Project of the Coursera.

The data comes from the work of Anguita et al (1) and was obtained with the accelerometer and gyroscope of a cell phone attached to the waist of several subjects.

The subjects were recorded while performing several activities, like walking, sitting, standing, laying, etc.

The data was downloaded and it had been previously manipulated as described by the authors.

The data was divided into two sets: training and testing. Each set contained three files: subjects, x values and y values. Subjects was only a list with the subject ID.
X values contained all the variable values, and Y values contained an ID number for the respective variable name.

A file called features linked this ID number with the actual variable name. Also, a file named activity linked each activity ID with the name of the activity.

Thus, the following was performed.

1. The zip file containing the data was downloaded into the local disk and properly unzipped.

2. The subjects, x values and y values, for both training and testing, were read into R as distinct data frames.

3. The subjects frame for training was merged with the subject frame from testing using the cbind function. The same was done with the x and y values.

4. The features file and the activites file were also uploaded into R.

5. Inside the features file, only the variables that contained the words mean or std were selected. The name of these variables was also cleaned to more proper form,
introducing upper cases for those words and removing parenthesis.

6. The list of these features were used to select only these features in the x values data frame.

7. Then, the three data frames - subjects, x values and y values - were binded together by columns.

8. The y labels were replaced with the actual activity name, setting the numbers as factor levels and the names as labels from the activites file.

9. The subject column was also transformed into a factor.

10. This data frame was molten into one data frame with only four columns, representing Subject, Activity, Variable name and value.

11. Average of values for each individual, activity and variable name were averaged. Thus, the tidy data set was created and stored.


Cited work: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
