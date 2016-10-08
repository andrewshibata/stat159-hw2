#phony targets
.PHONY:all data clean

#all
all:report.pdf eda-output.txt regression.RData

#data: downloads Advetising.csv to data/
data:
	cd data;curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> Advertising.csv

#regression.RData
regression.RData:regression-script.R Advertising.csv

#eda-output.txt
eda-output.txt:eda-script.R Advertising.csv

#report.pdf
report.pdf:report.Rmd regression.RData scatterplot-tv-sales.png

#clean: removes report documents
clean:
	rm report/report.*