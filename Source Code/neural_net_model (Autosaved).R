# Regression Tree
library(nnet)
adult.nnet = nnet(income~education+maritalStatus+race+sex+hoursPerWeek+occupation, data=adult.data, size=5, maxit=5000, decay=.001)

#lm(income~education+workclass+maritalStatus+race+sex+poly(educationNum,8)+poly(hoursPerWeek,8), data=adult.data)

summary(adult.poly)

# do the prediction
yhat = predict(adult.nnet,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0.5 , 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)

