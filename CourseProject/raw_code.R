library(UsingR)
library(ggplot2)
library(GGally)

?mtcars

ggally(mtcars)

?GGally
ggpairs(mtcars)
library(GGally) 

g<-ggplot(data = mtcars, aes(y = mpg, x = as.factor(am), fill = as.factor(am)))+geom_violin(colour = "black", size = 2) + xlab("Transmission type") + ylab("MPG")
g

#Creation of various models to make an anova comparison
fit0<-lm(mpg ~ as.factor(am),mtcars)

fit1<-update(fit0,mpg ~ am + cyl,mtcars)
fit2<-update(fit0,mpg ~ am + cyl+disp,mtcars)
fit3<-update(fit0,mpg ~ am + cyl+disp+hp,mtcars)
fit4<-update(fit0,mpg ~ am + cyl+disp+hp+wt,mtcars)
fit5<-update(fit0,mpg ~ am + cyl+disp+hp+wt+qsec,mtcars)
fit6<-update(fit0,mpg ~ am + cyl+disp+hp+wt+qsec+as.factor(vs),mtcars)
fit7<-update(fit0,mpg ~ am + cyl+disp+hp+wt+qsec+as.factor(vs)+as.factor(gear),mtcars)
fit8<-update(fit0,mpg ~ am + cyl+disp+hp+wt+qsec+as.factor(vs)+as.factor(gear)+as.factor(carb),mtcars)

anova(fit0,fit1,fit2,fit3,fit4,fit5,fit6,fit7,fit8)

cor(mtcars$wt,mtcars$cyl)

final_fit<-lm(mpg~as.factor(am)+as.factor(cyl)+wt+gear+hp,mtcars)
summary(final_fit)
plot(final_fit)

plot(mtcars$wt,mtcars$mpg)

# run linear regression for Fertility vs Agriculture + Examination + Education fit3 <- update(fit, Fertility ~ Agriculture + Examination + Education)
plot(fit1, which = 1)

summary

str(mtcars)
