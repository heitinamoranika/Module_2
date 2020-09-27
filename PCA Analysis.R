Fatdata <- read.csv("CleanData.csv",sep=",")

xmat <- Fatdata[,-(1:2)]
mcol <- c()
vcol <- c()
std.mat <- matrix(rep(NA,dim(xmat)[1]*dim(xmat)[2]),nrow=dim(xmat)[1],ncol=dim(xmat)[2]) #stardardize matrix
for(i in 1:dim(xmat)[2]){
  mcol[i] <- mean(xmat[,i]); vcol[i] <- var(xmat[,i])
  for(j in 1:dim(xmat)[1]){
  std.mat[j,i]<-(xmat[j,i]-mcol[i])/vcol[i]  
}}

std.cov <- cov(std.mat)
eigen.decomp <- eigen(std.cov) #eigen decomposition on COvariance matrix
e.val <- eigen.decomp$values #eigen values
e.vector <- eigen.decomp$vectors #eigen vectors

e.prop <- c()
for(i in 1:length(e.val)){
e.prop[i] <- e.val[i]/sum(e.val)  
}
e.prop
#about 99% of variance of the data can be explained by one pc loading

plot(1:6, e.val[1:6], type = "b", xlab = "# PCs", ylab ="Variance of PC", main = "PCA of Covariance Matrix") #Scree Plot to see how many pc loadings we are going to pick 

PC1 <- e.vector[,1]
PC1

cbind(colnames(Fatdata)[-(1:2)],PC1)

pc.scores <- std.mat%*%PC1 #rotating the axis

m <- lm(Fatdata[,2] ~ pc.scores)
m
pcr.pred <-predict(m,as.data.frame(std.mat)) #PCA regression
pcr.pred
R.square <- sum((pcr.pred-Fatdata[,2])^2)/length(Fatdata)
R.square
