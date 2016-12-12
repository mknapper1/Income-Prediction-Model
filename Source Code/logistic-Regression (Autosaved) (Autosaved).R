###########################
###logestic regression ####
###########################

adult.glm=glm(income~age+education+educationNum+capitalGain+capitalLoss+hoursPerWeek+sex
            +race+workclass+maritalStatus+relationship+occupation,data=adult.data,family= binomial)

yhat = predict(adult.glm,adult.test)

yhat = ifelse(yhat >= 0.5 , 1, 0)

mean((yhat - adult.test$income) ^ 2)



####################



adult.glm=glm(income~age+education+capitalGain+capitalLoss+hoursPerWeek,data=adult.data,family= binomial)

yhat = predict(adult.glm,adult.test)

yhat = ifelse(yhat >= 0.5 , 1, 0)

mean((yhat - adult.test$income) ^ 2)

#Result
[1] 0.1968922

#####################

summary(adult.glm)

adult.glm.simple = glm(income~age+educationNum+capitalGain+capitalLoss+hoursPerWeek+occupation+relationship,data=adult.data,family= binomial)

yhat = predict(adult.glm.simple,adult.test)

yhat = ifelse(yhat >= 0.5 , 1, 0)

mean((yhat - adult.test$income) ^ 2)





glm.probs=predict(glm.fit,type="response")
glm.probs[1:10]

glm.pred=rep(0,length(income))
glm.pred[glm.probs> .39]=1
incomeDirection =  rep(0, length(income))
incomeDirection[income == " >50K"] = 1
incomeDirection[1:60]
table(glm.pred,incomeDirection)
mean(glm.pred!=incomeDirection)

summary(glm.fit)
coef(glm.fit)
summary(glm.fit)$coef
summary(glm.fit)$coef[,4]
