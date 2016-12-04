# Regression Tree
library(tree)
adult.tree = tree(income~education+workclass+maritalStatus+race+sex, data=adult.data)

#lm(income~education+workclass+maritalStatus+race+sex+poly(educationNum,8)+poly(hoursPerWeek,8), data=adult.data)

summary(adult.tree)

# do the prediction
yhat = predict(adult.tree,adult.test)

# if yhat is greater than .5 it is 1 else 0
yhat = ifelse(yhat >= 0.5 , 1, 0)

# get and display the mse
mean((yhat - adult.test$income) ^ 2)

