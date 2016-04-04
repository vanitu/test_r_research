## GGPLOt games
library(UsingR)
data("diamond")
g<- ggplot(diamond,aes(x=carat,y=price) )
g= g+ xlab('Mass. Carats"')
g= g+ xlab('Price SIN $')
g=g+geom_point(size =6 , color = 'black', alpha=0.2)
g=g+geom_point(size =5 , color = 'black', alpha=0.2)
g=g+geom_smooth(method = lm, color = 'red')
g
