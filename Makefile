#phony targets
.PHONY:all data clean

#all
all:report/report.pdf data/eda-output.txt data/regression.RData 
#report.pdf
#data: downloads Advetising.csv to data/
data:
	curl -0 http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> Advertising.csv
	mv Advertising.csv data

#regression.RData
data/regression.RData:
	Rscript code/regression-script.R data/Advertising.csv

#eda-output.txt
data/eda-output.txt:
	Rscript code/eda-script.R data/Advertising.csv

#report.pdf
report/report.pdf:
	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'

#clean: removes report documents
clean:
	rm report/*.pdf
	rm report/*.html
