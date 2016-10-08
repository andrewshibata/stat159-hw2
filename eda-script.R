#reads in the Advertising.csv data set, and computes summary statitics and
#histograms of TV and Sales

#Reading in the data; data called on command line
args = commandArgs(trailingOnly=TRUE)
advertising = read.csv(args[1],header=TRUE)

#TV Summary statistics
tv_summary = c(summary(advertising$TV),var(advertising$TV),sd(advertising$TV))
names(tv_summary)[7] = 'Variance'
names(tv_summary)[8] = 'Standard Deviation'

#Sales Summary Statistics
sales_summary = c(summary(advertising$Sales),var(advertising$Sales),sd(advertising$Sales))
names(sales_summary)[7] = 'Variance'
names(sales_summary)[8] = 'Standard Deviation'

#Output as table
combined_summary = data.frame(matrix(tv_summary,sales_summary))
rownames(combined_summary) = c('TV', 'Sales')
colnames(combined_summary) = names(tv_summary)
sink('data/eda-output.txt')
combined_summary
sink()
save(bothSummary,file='data/eda-output.txt')

#Histograms as PDF and PNG
pdf('images/histogram-tv.pdf')
hist(advertising$TV,main='Histogram of TV Budgets',xlab='TV Budget (Thousands of Dollars)')
dev.off()
png('images/histogram-tv.png')
hist(advertising$TV,main='Histogram of TV Budgets',xlab='TV Budget (Thousands of Dollars)')
dev.off()

pdf('images/histogram-sales.pdf')
hist(advertising$Sales,main='Histogram of Sales',xlab='Units Sold (Thousands)')
dev.off()
png('images/histogram-sales.png')
hist(advertising$Sales,main='Histogram of Sales',xlab='Units Sold (Thousands)')
dev.off()