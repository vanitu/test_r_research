#LM under the hood
library('UsingR')
data(galton)

str(galton)

y<-galton$child
x<-galton$parent

#LM coefficients
beta1 <- cor(y,x)*sd(y)/sd(x)
beta0 <- mean(y) - beta1*mean(x)

#Control
fit <- lm(y ~ x)$coef 

#Normalization
xn <- (x-mean(x))/sd(x)
sd(xn) #should be 1

yn <- (y-mean(y))/sd(y)

library('dplyr')
freqData <- as.data.frame(table(galton$child,galton$parent))
names(freqData) <- c('child',"parent",'freq')
freqData$child <- as.numeric(as.character(freqData$child))
freqData$parent <- as.numeric(as.character(freqData$parent))

g <- ggplot(filter(freqData,freq>0),aes(x=parent,y=child))
g <- g + scale_size(range=c(2,20),guid='none')
g <- g + geom_point(color="grey60")
g <- g + geom_point(aes(color=freq,size=freq))
g <- g+ geom_smooth(method="lm",formula = y ~ x)
g 

