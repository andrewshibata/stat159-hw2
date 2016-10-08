#Makes a lm

#Reads in Advertising.csv from the command line arguments
args = commandArgs(trailingOnly=TRUE)
advertising = read.csv(args[1],header=TRUE)

#Linear model of Sales as a function of TV
fit = lm(Sales~TV,data=advertising)

#Summary of fit
lm_summary = summary(fit)
intercept = lm_summary$coefficients[1]
slope = lm_summary$coefficients[2]

#Outputting fit object
save(fit,file='data/regression.rData')

#Sales vs TV Scatterplot with Regression Line as PDF and PNG
pdf('images/scatterplot-tv-sales.pdf')
plot(advertising$TV,advertising$Sales,main='Regression: Sales vs TV',xlab='TV',ylab='Sales')
abline(intercept,slope,col='red')
dev.off()

png('images/scatterplot-tv-sales.png')
plot(advertising$TV,advertising$Sales,main='Regression: Sales vs TV',xlab='TV',ylab='Sales')
abline(intercept,slope,col='red')
dev.off()