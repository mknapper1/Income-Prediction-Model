###############################
# Linear Discriminant Analysis#
##############################
library(MASS)
lda.fit=lda(income~age+education+capitalGain+capitalLoss+hoursPerWeek+sex
         +race+workclass+maritalStatus+relationship+occupation,data=adult.data)
summary(lda.fit)

lda.pred=predict(lda.fit, adult.test)
names(lda.pred)
lda.class=lda.pred$class
table(lda.class,adult.test$income)
mean(lda.class!=adult.test$income)

###############################
