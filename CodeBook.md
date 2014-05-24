#Code Book

##Variables

subject - numbers 1-30, subjects in the test and training data

activity - walking, walking_upstairs, walking_downstairs, sitting, standing laying
activities that the subjects participated in while wearing the fitness monitor

tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz - X, Y, and Z components of body acceleration mean values

tbodyaccstdx, tbodyaccstdy, tbodyaccstdz - X,Y,Z components of body acceleration standard deviations values

tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz - X.Y.Z components of acceleration from gravity mean values

tgravityaccstdx, tgravityaccstdy, tgravityaccstdz - X,Y.Z components of acceleration from gravity standard deviations

tbodygyromeanx, tbodygyromeany, tbodygyromeanz - X,Y,Z components of angular velocity mean values

tbodygyrostdx, tbodygyrostdy, tbodygyrostdz - X,Y,Z components of angular velocity standard deviations

All of the tbody... variables above had been normalized in the raw data set so all values fall in the range -1 to 1.  Negative standard deviations are acceptable because of the normalization.

To create the summary, the training and test data sets were combined.  Variable names were changed to get rid of extraneous characters.  The values in the activity field were changed from number values 1-6 to the character strings listed above.
For each pair of subject and activity, the average of each tbody... variable was calculated using colmeans.  These averages are what appears in the tidy data summary.
A longer explanation of the code can be found in the README.