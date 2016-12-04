###########################
##    SETUP PROJECT     ###
###########################

# Set the project directory
path_to_project = '~/Projects/Income-Prediction-Model'
setwd(path_to_project)


###########################
## SETUP TRAINING DATA  ###
###########################

# Read the training data
adult.data = read.csv('Data/adult.data.csv', header=F)

# Set the column names
colnames(adult.data) = c('age','workclass','fnlwgt','education','educationNum','maritalStatus','occupation','relationship','race','sex','capitalGain','capitalLoss','hoursPerWeek','nativeCountry','income')

adult.data$income[1:40]

dim(adult.data)

is.na(adult.data) = adult.data=='?'
is.na(adult.data) = adult.data==' ?'
adult.data = na.omit(adult.data)

# Remove the fnlwgt column
adult.data = subset(adult.data, select = -fnlwgt)

# Combine workclass groups
adult.data$workclass = gsub("Self-emp-inc","Self-emp",adult.data$workclass)
adult.data$workclass = gsub("Self-emp-not-inc","Self-emp",adult.data$workclass)
adult.data$workclass = gsub("Never-worked","Not-working",adult.data$workclass)
adult.data$workclass = gsub("Without-pay","Not-working",adult.data$workclass)
adult.data$workclass = gsub("State-gov","Small-gov",adult.data$workclass)
adult.data$workclass = gsub("Local-gov","Small-gov",adult.data$workclass)
table(adult.data$workclass)

# Combine education groups
adult.data$education = gsub("Preschool","Dropout",adult.data$education)
adult.data$education = gsub("1st-4th","Dropout",adult.data$education)
adult.data$education = gsub("5th-6th","Dropout",adult.data$education)
adult.data$education = gsub("7th-8th","Dropout",adult.data$education)
adult.data$education = gsub("9th","Dropout",adult.data$education)
adult.data$education = gsub("10th","Dropout",adult.data$education)
adult.data$education = gsub("11th","Dropout",adult.data$education)
adult.data$education = gsub("12th","Dropout",adult.data$education)
adult.data$education = gsub("HS-grad","HS-grad",adult.data$education)
adult.data$education = gsub("Some-college","HS-grad",adult.data$education)
adult.data$education = gsub("Assoc-acdm","Assoc",adult.data$education)
adult.data$education = gsub("Assoc-voc","Assoc",adult.data$education)
table(adult.data$education)

# Combine marital status groups
adult.data$maritalStatus = gsub("Married-AF-spouse","Married",adult.data$maritalStatus)
adult.data$maritalStatus = gsub("Married-civ-spouse","Married",adult.data$maritalStatus)
adult.data$maritalStatus = gsub("Married-spouse-absent","Not-married",adult.data$maritalStatus)
adult.data$maritalStatus = gsub("Separated","Not-married",adult.data$maritalStatus)
adult.data$maritalStatus = gsub("Divorced","Not-married",adult.data$maritalStatus)
table(adult.data$maritalStatus)

table(adult.data$occupation)


# make the income data easier to work with
adult.data = within(adult.data, {
	income = ifelse(income ==  ' >50K', 1, 0)
})


# Display first 5 rows to verify everything looks like it should
adult.data[0:5,]

dim(adult.data)


###########################
###   SETUP TEST DATA  ####
###########################


# Read the test data
adult.test = read.csv('Data/adult.test.csv')

# Set the test column names
colnames(adult.test) = c('age','workclass','fnlwgt','education','educationNum','maritalStatus','occupation','relationship','race','sex','capitalGain','capitalLoss','hoursPerWeek','nativeCountry','income')

dim(adult.test)

is.na(adult.test) = adult.test=='?'
is.na(adult.test) = adult.test==' ?'
adult.test = na.omit(adult.test)


# Remove the fnlwgt column
adult.test = subset(adult.test, select = -fnlwgt)

# Combine workclass groups
adult.test$workclass = gsub("Self-emp-inc","Self-emp",adult.test$workclass)
adult.test$workclass = gsub("Self-emp-not-inc","Self-emp",adult.test$workclass)
adult.test$workclass = gsub("Never-worked","Not-working",adult.test$workclass)
adult.test$workclass = gsub("Without-pay","Not-working",adult.test$workclass)
adult.test$workclass = gsub("State-gov","Small-gov",adult.test$workclass)
adult.test$workclass = gsub("Local-gov","Small-gov",adult.test$workclass)
table(adult.test$workclass)

# Combine education groups
adult.test$education = gsub("Preschool","Dropout",adult.test$education)
adult.test$education = gsub("1st-4th","Dropout",adult.test$education)
adult.test$education = gsub("5th-6th","Dropout",adult.test$education)
adult.test$education = gsub("7th-8th","Dropout",adult.test$education)
adult.test$education = gsub("9th","Dropout",adult.test$education)
adult.test$education = gsub("10th","Dropout",adult.test$education)
adult.test$education = gsub("11th","Dropout",adult.test$education)
adult.test$education = gsub("12th","Dropout",adult.test$education)
adult.test$education = gsub("HS-grad","HS-grad",adult.test$education)
adult.test$education = gsub("Some-college","HS-grad",adult.test$education)
adult.test$education = gsub("Assoc-acdm","Assoc",adult.test$education)
adult.test$education = gsub("Assoc-voc","Assoc",adult.test$education)
table(adult.test$education)

# Combine marital status groups
adult.test$maritalStatus = gsub("Married-AF-spouse","Married",adult.test$maritalStatus)
adult.test$maritalStatus = gsub("Married-civ-spouse","Married",adult.test$maritalStatus)
adult.test$maritalStatus = gsub("Married-spouse-absent","Not-married",adult.test$maritalStatus)
adult.test$maritalStatus = gsub("Separated","Not-married",adult.test$maritalStatus)
adult.test$maritalStatus = gsub("Divorced","Not-married",adult.test$maritalStatus)
table(adult.test$maritalStatus)

table(adult.test$occupation)


# make the test data easier to work with
adult.test = within(adult.test, {
	income = ifelse(income ==  ' >50K.', 1, 0)
})

# Display first 5 rows to verify everything looks like it should
adult.test[0:5,]
dim(adult.test)
names(adult.test)