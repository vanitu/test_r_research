#
library('UsingR')

data(galton)
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

#Manipulate data ggplot
install.packages('manipulate')
library(manipulate)

myHist<-function(mu){
  mse <- mean((galton$child - mu)^2)
  g <- ggplot(galton,aes(x=child))+geom_histogram(fill='salmon',color='black',binwidth=1)
  g <- g + geom_vline(xintercept=mu,size=2)
  g <- g + ggtitle(paste("mu = ",mu,", MSE =", round(mse,2), sep=""))
  g
}

manipulate(myHist(mu),mu=slider(62,74,step=0.5))

