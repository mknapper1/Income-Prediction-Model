# linear regression using random variable selected by me
adult.poly = lm(income~education+workclass+maritalStatus+race+sex, data=adult.data)

# do the prediction
yhat = predict(adult.poly,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0.5 , 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)

