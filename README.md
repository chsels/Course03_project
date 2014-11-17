#project codebook

##Code Description

code filename: run_analysis.R

overview: Code is used to tidy up and summarize data from the "Human Activity Recognition Using Smartphones Data Set" (for more detailed information on the dataset see - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.), which provides accelerometer data from a samsung galaxy smartphone that is worn by 30 participants that perform various activities tasks. The data are broken into two groups: test and train.

code:
 * read in all relavant data:
   * names of the measurements (variables: nam) 
   * main observations that for the test and train groups (variables: testX and trainX). 
   * activity list for the observations (variable: testY and trainY). 
   * subject ids (variable: testSubjects and trainSubjects). 
   * activity key (variables: activ). 
 * combine the main measurements (rbind): testX and trainX -> result
 * combine lists with subject ids (rbind): testSubjects and trainSubjects -> resultSubjects
 * combine lists with activities (rbind): testY and trainY -> resultsY
 * only save mean and standard deviation measurements from the accelerometers: store in result
 * combine saved measurements with person ids and activity values: resultSubjects and resultsY and result -> result
 * transform activities column in result from values to names using the key variable activ
 * group by person id and activities 
 * summarize all columns by taking mean for all groups: id and activity 
 * write table to file

