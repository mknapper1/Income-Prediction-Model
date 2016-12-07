###############################
# Quadratic Discriminant Analysis#
##################################
## NO WorkClass , it casued mistakes !!!!!

qda.fit=qda(income~age+education+capitalGain+capitalLoss+hoursPerWeek+sex
            +race+maritalStatus+relationship+occupation,data=adult.data)
qda.fit
qda.class=predict(qda.fit,adult.test)$class
table(qda.class,adult.test$income)
mean(qda.class!=adult.test$income)

###############################
