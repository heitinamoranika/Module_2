#This is main code for Module 2

#[TOC]

#1. Clean Part
#2. Model Build
#3. Model Diagnosis




#It require the following package to plot
if (!require(ggplot2)){
  install.packages("ggplot2")
}
if (!require(grid)){
  install.packages("grid")
}
if (!require(gridExtra)){
  install.packages("gridExtra")
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

#182, his BODYFAT is 0, which is impossible, calculate his BODYFAT by Siri equation, his BODYFAT should be: -3.611687, which is also impossible, we decide to remove him.
#216 has outstanding BODYFAT, for his DENSITY is too small, check his weight, we define 216 as an extremely obesity case, we decide to keep him.
#39 occurs too many time in boxplot, just like 216, he is also an obesity case with too many outliers value, we decide to keep him. 
#42 whose HEIHT is 29.5 inches (74.93 cm), which is too short, we decide to remove him
#41 occurs too many time in boxplot, just like 39, he is also an obesity case with too many outliers value, we decide to keep him

FirstFilterData=data.frame(RawData[-c(182,42),])
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


