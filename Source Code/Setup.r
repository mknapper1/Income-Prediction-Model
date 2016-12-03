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
colnames(adult.data) = c('age','workclass','fnlwgt','education','education-num','marital-status','occupation','relationship','race','sex','capital-gain','capital-loss','hours-per-week','native-country','income')

# Remove the fnlwgt column
adult.data = subset(adult.data, select = -fnlwgt)


# make the data easier to work with
adult.data = within(adult.data, {
	income = ifelse(income ==  ' >50K', 1, 0)
})


# Display first 5 rows to verify everything looks like it should
adult.data[0:5,]


###########################
###   SETUP TEST DATA  ####
###########################


# Read the test data
adult.test = read.csv('Data/adult.test.csv')

# Set the test column names
colnames(adult.test) = c('age','workclass','fnlwgt','education','education-num','marital-status','occupation','relationship','race','sex','capital-gain','capital-loss','hours-per-week','native-country','income')

# Remove the fnlwgt column
adult.test = subset(adult.test, select = -fnlwgt)

# make the test data easier to work with
adult.test = within(adult.test, {
	income = ifelse(income ==  ' >50K.', 1, 0)
})

# Display first 5 rows to verify everything looks like it should
adult.test[0:5,]
