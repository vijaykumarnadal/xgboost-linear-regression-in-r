#loading the require packages
library(xgboost)
library(car)
'%ni%'<-Negate('%in%')
#loading the data
pdata<-read.csv("Prestige.csv",header = T)
colSums(is.na(pdata))
#remove na columns
pdata<-na.omit(pdata)
#splitting data into train and test
s<-sample(2,nrow(pdata),replace = T,prob = c(0.7,0.3))
ptrain<-pdata[s==1,]
ptest<-pdata[s==2,]
#preparing the data for xgboost model
trainxg<-xgb.DMatrix(data.matrix(ptrain[,colnames(ptrain)%ni%"prestige"],label=as.numeric(ptrain$prestige))
testxg<-xgb.DMatrix(data.matrix(etest2[,,colnames(ptrain)%ni%"prestige"])
#params list
param<-list("objective"="reg:linear","eval_metric"="rmse")
pmodel<-xgb.train(params = param,data=trainxg,nrounds = 5,booster="gbtree",nfold=3)
#prediction
p<-predict(pmodel,testxg)

#to do list
#try model with different parameters
#tuning
                          
