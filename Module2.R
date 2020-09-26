#This is main code for Module 2
#Please run the code line by line

#Main code edited by ENZE WANG

#Fix by CHENYANG JIANG, HanGyu KANG and RUI HUANG

#[TOC]

#1. Clean Part

#2. Model Build

#3. Model Diagnosis




#It require the following package 
if (!require(ggplot2)){
  install.packages("ggplot2")
}
if (!require(grid)){
  install.packages("grid")
}
if (!require(gridExtra)){
  install.packages("gridExtra")
}
if (!require(car)){
  install.packages("car")
}

#Please put the Module2.R into the main Folder and run it instead of in Code Folder, or it may not find the BodyFat.csv
#Everybody change and add code will provide their name and action every line. 
#The following is clean part 

#1. Clean Part


#Read the BodyFat.csv
RawData = read.csv("Data/BodyFat.csv",sep=",")
RawDataFrame=data.frame(RawData)
#Look what our data looks like
head(RawData)
tail(RawData)
dim(RawData)
colnames(RawData)
summary(RawData)

#The following part will use ggplot to study our data, we highly recommend you to check line by line to plot pictures you want, there are so many plot. 
#Look the histogram of all variables:
ggplot(RawDataFrame, aes(x=BODYFAT))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of BODYFAT")
ggsave("Image/BODYFAT_His.jpeg")
ggplot(RawDataFrame, aes(x=DENSITY))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of DENSITY")
ggsave("Image/DENSITY_His.jpeg")
ggplot(RawDataFrame, aes(x=AGE))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of AGE")
ggsave("Image/AGE_His.jpeg")
ggplot(RawDataFrame, aes(x=WEIGHT))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of WEIGHT")
ggsave("Image/WEIGHT_His.jpeg")
ggplot(RawDataFrame, aes(x=HEIGHT))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of HEIGHT")
ggsave("Image/HEIGHT_His.jpeg")
ggplot(RawDataFrame, aes(x=ADIPOSITY))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of ADIPOSITY")
ggsave("Image/ADIPOSITY_His.jpeg")
ggplot(RawDataFrame, aes(x=NECK))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of NECK")
ggsave("Image/NECK_His.jpeg")
ggplot(RawDataFrame, aes(x=CHEST))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of CHEST")
ggsave("Image/CHEST_His.jpeg")
ggplot(RawDataFrame, aes(x=ABDOMEN))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of ABDOMEN")
ggsave("Image/ABDOMEN_His.jpeg")
ggplot(RawDataFrame, aes(x=HIP))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of HIP")
ggsave("Image/HIP_His.jpeg")
ggplot(RawDataFrame, aes(x=THIGH))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of THIGH")
ggsave("Image/THIGH_His.jpeg")
ggplot(RawDataFrame, aes(x=KNEE))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of KNEE")
ggsave("Image/KNEE_His.jpeg")
ggplot(RawDataFrame, aes(x=ANKLE))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of ANKLE")
ggsave("Image/ANKLE_His.jpeg")
ggplot(RawDataFrame, aes(x=BICEPS))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of BICEPS")
ggsave("Image/BICEPS_His.jpeg")
ggplot(RawDataFrame, aes(x=FOREARM))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of FOREARM")
ggsave("Image/FOREARM_His.jpeg")
ggplot(RawDataFrame, aes(x=WRIST))+geom_histogram(color='blue',fill='blue',alpha=0.5)+ggtitle("Histogram of WRIST")
ggsave("Image/WRIST_His.jpeg")

#Boxplot
g1=ggplot(RawDataFrame,aes(x=BODYFAT))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of BODYFAT")
g2=ggplot(RawDataFrame,aes(x=DENSITY))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of DENSITY")
g3=ggplot(RawDataFrame,aes(x=AGE))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of AGE")
g4=ggplot(RawDataFrame,aes(x=WEIGHT))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of WEIGHT")
g5=ggplot(RawDataFrame,aes(x=HEIGHT))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of HEIGHT")
g6=ggplot(RawDataFrame,aes(x=ADIPOSITY))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of ADIPOSITY")
g7=ggplot(RawDataFrame,aes(x=NECK))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of NECK")
g8=ggplot(RawDataFrame,aes(x=CHEST))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of CHEST")
g9=ggplot(RawDataFrame,aes(x=ABDOMEN))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of ABDOMEN")
g10=ggplot(RawDataFrame,aes(x=HIP))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of HIP")
g11=ggplot(RawDataFrame,aes(x=THIGH))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of THIGH")
g12=ggplot(RawDataFrame,aes(x=KNEE))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of KNEE")
g13=ggplot(RawDataFrame,aes(x=ANKLE))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of ANKLE")
g14=ggplot(RawDataFrame,aes(x=BICEPS))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of BICEPS")
g15=ggplot(RawDataFrame,aes(x=FOREARM))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of FOREARM")
g16=ggplot(RawDataFrame,aes(x=WRIST))+geom_boxplot(color='blue',fill='blue',alpha=0.5)+ coord_flip()+ggtitle("Boxplot of WRIST")

g=grid.arrange(g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, nrow = 4)
ggsave("Image/Boxplot_all.jpeg",g)

#Our raw data should pass three levels of data clean process
#First is boxplot, check any Null or abnormal value
#Second, BODYFAT and DENSITY must meet Siri equation
#Third, WEIGHT and HIGHT must meet BMI formula
#Beyond the two equations above, there is no correlative dependence among variables. 

#From boxplot we found the following outliers:
#The number after variables is theindex in BodyFat.csv from the boxplot of this variables
#182 with BODYFAT 0, which is not shown in boxplot, reminding us to check the data again without boxplot to find outliers. 
#BODYFAT: 216, 182
#DENSITY: 216
#AGE:
#WEIGHT: 39, 41
#HEIGHT: 42
#ADIPOSITY: 39, 41, 216, 242
#NECK: 39, 45, 106
#CHEST: 39, 41
#ABDOMEN: 39, 41, 216
#HIP: 39, 41, 35
#THIGH:39, 169, 152
#KNEE: 39, 244, 192
#ANKLE:31, 86, 39
#BICEPS:39
#FOREARM:159, 206, 45,226, 175
#WRIST:41,39,252,226

#182, his BODYFAT is 0, which is impossible, calculate his BODYFAT by Siri equation, his BODYFAT should be: -3.611687, which is also impossible, we decide to delete him.
#216 has outstanding BODYFAT, check his weight, we define 216 as an extremely obesity case, we decide to delete him.
#39 occurs too many time in boxplot, just like 216, he is also an obesity case with too many outliers value, we decide to delete him. 
#42 whose HEIGHT is 29.5 inches (74.93 cm), which is too short, which can be fixed in BMI steps, the real HEIGHT is 69.4255 inches (176.34077 cm)
#41 occurs too many time in boxplot, just like 39, he is also an obesity case with too many outliers value, we decide to delete him

FirstFilterData=data.frame(RawData[-c(182,216,39,41),])
FirstFilterData[FirstFilterData$IDNO==42,"HEIGHT"]=69.4255
#If you want to check whether our CleanData meets Siri equation, just replace the above line with the following line. 
#FirstFilterData=CleanData
dim(FirstFilterData)

#Siri equation:
#Fit the BODYFAT with 1/DENSITY and check any outliers beyond the fitting line. 
FirstFilterData[,"invDENSITY"]=1/FirstFilterData$DENSITY
SiriModel=lm(BODYFAT~invDENSITY,data=FirstFilterData)
jpeg(file="Image/Siri_Equation_Outliers.jpeg")
par(mfrow=c(2,3)) 
plot(SiriModel)
plot(BODYFAT~invDENSITY,data=FirstFilterData,type="n")
abline(SiriModel, col="red", lwd=3)
text(BODYFAT~invDENSITY, FirstFilterData$IDNO,data=FirstFilterData, cex=1, font=1)
dev.off()

#96, 76, 48's BODYFAT do not meet their DENSITY by Siri Equation
#we decide to use the Siri equation calcualte their BODYFAT again and update.

for(i in c(96,76,48)){
  NewBODYFAT=495/FirstFilterData[FirstFilterData$IDNO==i,"DENSITY"]-450
  print(NewBODYFAT)
}

#We found that the New BODYFAT of 96 is too small compared with other people, so we decide to use the his initial BODYFAT to update his DENSITY with Siri equation. 
#BODYFAT of 48 also changed too high, but considering that BODYFAT is from DENSITY by Siri equation, we perfer to change BODYFAT first. 

SecondFilterData=FirstFilterData[,-which(names(FirstFilterData) %in% c("invDENSITY"))]
SecondFilterData[SecondFilterData$IDNO==48,"BODYFAT"]=495/SecondFilterData[SecondFilterData$IDNO==48,"DENSITY"]-450
SecondFilterData[SecondFilterData$IDNO==76,"BODYFAT"]=495/SecondFilterData[SecondFilterData$IDNO==76,"DENSITY"]-450
SecondFilterData[SecondFilterData$IDNO==96,"DENSITY"]=495/(SecondFilterData[SecondFilterData$IDNO==96,"BODYFAT"]+450)

#BMI equation:
#BMI=WEIGHT(kg)/HEIGHT(m)^2=703*WEIGHT(lb)/HEIGHT(in)^2 from wikipedia

#If you want to check whether our CleanData meets BMI equation, just replace the above line with the following line. 
#SecondFilterData=CleanData

SecondFilterData[,"BMIX"]=(SecondFilterData$WEIGHT)/((SecondFilterData$HEIGHT)^2)
BMIModel=lm(ADIPOSITY~BMIX,data=SecondFilterData)
jpeg(file="Image/BMI_Outliers.jpeg")
par(mfrow=c(2,3)) 
plot(BMIModel)
plot(ADIPOSITY~BMIX,data=SecondFilterData,type="n")
abline(BMIModel, col="red", lwd=3)
text(ADIPOSITY~BMIX, SecondFilterData$IDNO,data=SecondFilterData, cex=1, font=1)
dev.off()

#The two outliers is 221 and 163, their new BMI is:

for(i in c(163,221)){
  NewBMI=703*SecondFilterData[SecondFilterData$IDNO==i,"WEIGHT"]/(SecondFilterData[SecondFilterData$IDNO==i,"HEIGHT"]^2)
  print(NewBMI)
}

#No problem, update their new BMI:

CleanData=SecondFilterData[,-which(names(SecondFilterData) %in% c("BMIX"))]
CleanData[CleanData$IDNO==163,"ADIPOSITY"]=703*CleanData[CleanData$IDNO==163,"WEIGHT"]/(CleanData[CleanData$IDNO==i,"HEIGHT"]^2)
CleanData[CleanData$IDNO==221,"ADIPOSITY"]=703*CleanData[CleanData$IDNO==221,"WEIGHT"]/(CleanData[CleanData$IDNO==i,"HEIGHT"]^2)
CleanData=data.frame(CleanData)
dim(CleanData)

#Output our CleanData to Data folder. 
write.csv(CleanData,'Data/CleanData.csv',row.names = FALSE)



#2. Model Build



#Input our CleanData
CleanData = read.csv("Data/CleanData.csv",sep=",")
CleanData=CleanData[,-c(1,3)]
n=dim(CleanData)[1]
#We first test the vif of the simple linear regression
SLR = lm(BODYFAT~.,data=CleanData) 
vif = car::vif(SLR) 
mean(vif) 
vif

#You can see that there is serious multicollinearity, therefore after we build our final model, we will check the multicollinearity, and our model should be as simple as possible
jpeg(file="Image/Simple_Linear_Regression_Analysis.jpeg")
par(mfrow=c(2,3)) 
plot(SLR) 
boxplot(SLR$residuals)
dev.off()

#The normality also not hold perfectly, therefore we will also care about the normality in the future model. 

#We will selct the best model with log and square transformation. 
LogAGE=log(CleanData$AGE)
LogWEIGHT=log(CleanData$WEIGHT)
LogHEIGHT=log(CleanData$HEIGHT)
LogADIPOSITY=log(CleanData$ADIPOSITY)
LogNECK=log(CleanData$NECK)
LogCHEST=log(CleanData$CHEST)
LogABDOMEN=log(CleanData$ABDOMEN)
LogHIP=log(CleanData$HIP)
LogTHIGH=log(CleanData$THIGH)
LogKNEE=log(CleanData$KNEE)
LogANKLE=log(CleanData$ANKLE)
LogBICEPS=log(CleanData$BICEPS)
LogFOREARM=log(CleanData$FOREARM)
LogWRIST=log(CleanData$WRIST)

sqAGE=CleanData$AGE^2
sqWEIGHT=CleanData$WEIGHT^2
sqHEIGHT=CleanData$HEIGHT^2
sqADIPOSITY=CleanData$ADIPOSITY^2
sqNECK=CleanData$NECK^2
sqCHEST=CleanData$CHEST^2
sqABDOMEN=CleanData$ABDOMEN^2
sqHIP=CleanData$HIP^2
sqTHIGH=CleanData$THIGH^2
sqKNEE=CleanData$KNEE^2
sqANKLE=CleanData$ANKLE^2
sqBICEPS=CleanData$BICEPS^2
sqFOREARM=CleanData$FOREARM^2
sqWRIST=CleanData$WRIST^2

ExtendData=cbind(CleanData,LogAGE,LogWEIGHT,LogHEIGHT,LogADIPOSITY,LogNECK,LogCHEST,LogABDOMEN,LogHIP,LogTHIGH,LogKNEE,LogANKLE,LogBICEPS,LogFOREARM,LogWRIST
                 ,sqAGE,sqWEIGHT,sqHEIGHT,sqADIPOSITY,sqNECK,sqCHEST,sqABDOMEN,sqHIP,sqTHIGH,sqKNEE,sqANKLE,sqBICEPS,sqFOREARM,sqWRIST)

SLR0=lm(BODYFAT~1,data=ExtendData)
SLR_Full=lm(BODYFAT~AGE+WEIGHT+HEIGHT+ADIPOSITY+NECK+CHEST+ABDOMEN+HIP+THIGH+KNEE+ANKLE+BICEPS+FOREARM+WRIST,data=ExtendData)
SLR_Log_Full=lm(BODYFAT~LogAGE+LogWEIGHT+LogHEIGHT+LogADIPOSITY+LogNECK+LogCHEST+LogABDOMEN+LogHIP+LogTHIGH+LogKNEE+LogANKLE+LogBICEPS+LogFOREARM+LogWRIST,data=ExtendData)
SLR_sq_Full=lm(BODYFAT~sqAGE+sqWEIGHT+sqHEIGHT+sqADIPOSITY+sqNECK+sqCHEST+sqABDOMEN+sqHIP+sqTHIGH+sqKNEE+sqANKLE+sqBICEPS+sqFOREARM+sqWRIST,data=ExtendData)
SLR_All_Full=lm(BODYFAT~.,data=ExtendData)

# forward AIC
step(SLR0,scope=list(upper=SLR_Full),direction='forward', k=2)
#AIC=682.97
#BODYFAT ~ ABDOMEN + WEIGHT + WRIST + ADIPOSITY + NECK + AGE + FOREARM + CHEST

# forward AIC
step(SLR0,scope=list(upper=SLR_Log_Full),direction='forward', k=2)
#AIC=679.57
#BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT + LogNECK + LogAGE + LogFOREARM

# forward AIC
step(SLR0,scope=list(upper=SLR_sq_Full),direction='forward', k=2)
#AIC=690.23
#BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST + sqBICEPS

# forward AIC
step(SLR0,scope=list(upper=SLR_All_Full),direction='forward', k=2)
#AIC=676.74
#BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST + LogADIPOSITY + LogNECK + LogBICEPS + sqBICEPS + AGE + CHEST + sqNECK + sqFOREARM

# forward BIC
step(SLR0,scope=list(upper=SLR_Full),direction='forward', k=log(n))
#BIC=700.41
#BODYFAT ~ ABDOMEN + WEIGHT + WRIST

# forward BIC
step(SLR0,scope=list(upper=SLR_Log_Full),direction='forward', k=log(n))
#BIC=697.82
#BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT

# forward BIC
step(SLR0,scope=list(upper=SLR_sq_Full),direction='forward', k=log(n))
#BIC=705.87
#BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST

# forward BIC
step(SLR0,scope=list(upper=SLR_All_Full),direction='forward', k=log(n))
#AIC=697.68
#BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST



#The best model are the following, we check their VIF:


#BODYFAT ~ ABDOMEN + WEIGHT + WRIST + ADIPOSITY + NECK + AGE + FOREARM + CHEST
Model1 = lm(BODYFAT ~ ABDOMEN + WEIGHT + WRIST + ADIPOSITY + NECK + AGE + FOREARM + CHEST,data=ExtendData) 
vif = car::vif(Model1) 
mean(vif) 
#6.085865
max(vif)
# 11.50582
#Exist serious multicollinearity

#BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT + LogNECK + LogAGE + LogFOREARM

Model2 = lm(BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT + LogNECK + LogAGE + LogFOREARM,data=ExtendData) 
vif = car::vif(Model2) 
mean(vif) 
#2.096706
max(vif)
# 3.163965
#Not serious multicollinearity

#BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST + sqBICEPS

Model3 = lm(BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST + sqBICEPS,data=ExtendData) 
vif = car::vif(Model3) 
mean(vif) 
#3.832809
max(vif)
# 6.772439
#Not serious multicollinearity

#BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST + LogADIPOSITY + LogNECK + LogBICEPS + sqBICEPS + AGE + CHEST + sqNECK + sqFOREARM

Model4 = lm(BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST + LogADIPOSITY + LogNECK + LogBICEPS + sqBICEPS + AGE + CHEST + sqNECK + sqFOREARM,data=ExtendData) 
vif = car::vif(Model4) 
mean(vif) 
#61.19585
max(vif)
# 212.3222
#Exist serious multicollinearity

#BODYFAT ~ ABDOMEN + WEIGHT + WRIST

Model5 = lm(BODYFAT ~ ABDOMEN + WEIGHT + WRIST,data=ExtendData) 
vif = car::vif(Model5) 
mean(vif) 
#3.819638
max(vif)
# 5.385934
#Not serious multicollinearity

#BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT

Model6 = lm(BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT,data=ExtendData) 
vif = car::vif(Model6) 
mean(vif) 
#1.48797
max(vif)
# 1.735822
#Not serious multicollinearity

#BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST

Model7 = lm(BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST,data=ExtendData) 
vif = car::vif(Model7) 
mean(vif) 
#3.673506
max(vif)
#5.134862
#Not serious multicollinearity

#BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST

Model8 = lm(BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST,data=ExtendData) 
vif = car::vif(Model8) 
mean(vif) 
#3.595182
max(vif)
# 4.976449
#Not serious multicollinearity

#In the model before, ABDOMEN is the most important, we will test is there any necessary to add other variables:

model1=lm(BODYFAT ~ ABDOMEN + WEIGHT + WRIST,data=ExtendData)
summary(model1)
#Multiple R-squared:  0.7168,	Adjusted R-squared:  0.7133 
model1a=lm(BODYFAT ~ ABDOMEN + WEIGHT,data=ExtendData)
summary(model1a)
#Multiple R-squared:  0.7053,	Adjusted R-squared:  0.7029
model1b=lm(BODYFAT ~ ABDOMEN + WRIST,data=ExtendData)
summary(model1b)
#Multiple R-squared:  0.7003,	Adjusted R-squared:  0.6979 
model2=lm(BODYFAT ~ LogABDOMEN + LogWRIST + LogHEIGHT,data=ExtendData)
summary(model2)
#Multiple R-squared:  0.7198,	Adjusted R-squared:  0.7163 
model2a=lm(BODYFAT ~ LogABDOMEN + LogWRIST,data=ExtendData)
summary(model2a)
#Multiple R-squared:  0.7032,	Adjusted R-squared:  0.7007 
model2b=lm(BODYFAT ~ LogABDOMEN + LogHEIGHT,data=ExtendData)
summary(model2b)
#Multiple R-squared:  0.6986,	Adjusted R-squared:  0.6962 
model3=lm(BODYFAT ~ sqABDOMEN + sqWEIGHT + sqWRIST,data=ExtendData)
summary(model3)
#Multiple R-squared:  0.7105,	Adjusted R-squared:  0.7069 
model3a=lm(BODYFAT ~ sqABDOMEN + sqWEIGHT,data=ExtendData)
summary(model3a)
#Multiple R-squared:  0.7017,	Adjusted R-squared:  0.6993 
model3b=lm(BODYFAT ~ sqABDOMEN + sqWRIST,data=ExtendData)
summary(model3b)
#Multiple R-squared:  0.6903,	Adjusted R-squared:  0.6878 
model4=lm(BODYFAT ~ ABDOMEN + sqWEIGHT + LogWRIST,data=ExtendData)
summary(model4)
#Multiple R-squared:  0.7199,	Adjusted R-squared:  0.7165 
model4a=lm(BODYFAT ~ ABDOMEN + sqWEIGHT,data=ExtendData)
summary(model4a)
#Multiple R-squared:  0.7079,	Adjusted R-squared:  0.7056 
model4b=lm(BODYFAT ~ ABDOMEN + LogWRIST,data=ExtendData)
summary(model4b)
#Multiple R-squared:  0.7003,	Adjusted R-squared:  0.6979 