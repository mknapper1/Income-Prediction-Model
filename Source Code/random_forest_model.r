# Random forest
library(randomForest)
adult.rf = randomForest(income~educationNum+hoursPerWeek, data=adult.data, mtry=6, importance=TRUE)

#lm(income~education+workclass+maritalStatus+race+sex+poly(educationNum,8)+poly(hoursPerWeek,8), data=adult.data)

summary(adult.rf)

# do the prediction
yhat = predict(adult.rf,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0.5 , 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)

