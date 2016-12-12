# linear regression using random variable selected by me
adult.poly = lm(income~poly(age,12)+education+poly(capitalGain,12)+poly(capitalLoss,12)+poly(hoursPerWeek,16)+sex+race+workclass+maritalStatus+relationship+occupation, data=adult.data)

#summary(adult.poly)

# do the prediction
yhat = predict(adult.poly,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0.5 , 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)

