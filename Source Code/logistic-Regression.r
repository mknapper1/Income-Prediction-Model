###########################
###logestic regression ####
###########################

glm.fit=glm(income~age+education+capitalGain+capitalLoss+hoursPerWeek+sex
            +race+workclass+maritalStatus+relationship+occupation,data=adult.data,family= binomial)

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
