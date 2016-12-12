# Regression Tree
library(nnet)
adult.nnet = nnet(income~age+education+educationNum+capitalGain+capitalLoss+hoursPerWeek+sex
            +race+workclass+maritalStatus+relationship+occupation, data=adult.data, size=12, maxit=5000, decay=.001)

# do the prediction
yhat = predict(adult.nnet,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0.5 , 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)

