library(nnet)
adult.nnet = nnet(income~educationNum, data=adult.data, size=15, maxit=10000, decay=.1)

adult.glm = glm(income~age+education+capitalGain+capitalLoss+hoursPerWeek+sex
        	+race+workclass+maritalStatus+relationship+occupation,data=adult.data,family= binomial)

# do the prediction
yhat = predict(adult.glm,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0, 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)
