setwd("~/Projects/Income-Prediction-Model")
pData= read.table("Data/adult.data",sep = ",",header = F)
colnames(pData)= c("age","Wcls","fnlwt","edu","eduNum","marStat","ocupp","relation","race","sex","capGain","capLoss","hperW","nCountry","sal")
dim(pData)
names(pData)
str(pData)
cor(pData)
attach(pData)
contrasts(sal)
pData$sal <- factor(pData$sal,levels = c(1,2), labels = c("L", "H")) 
#### Logistic Refression ######################
sal01 =rep(0,length(sal))
sal01[levels(sal)==2]= 1  # <=50K
sal01[1:20]
glm.fit=glm(sal01~age+fnlwt+edu+eduNum+capGain+capLoss+hperW+sex
  +race+Wcls+marStat+relation+ocupp,data=pData,family="binomial")

glm.probs=predict(glm.fit,type="response")
glm.probs[1:10]

glm.pred=rep(0,length(sal))
glm.pred[glm.probs> .5]=1
salDirection =  rep(0, length(sal))
salDirection[sal01==1] = 1
table(glm.pred,salDirection)
mean(glm.pred!=salDirection)
