#phony targets
.PHONY:all data clean

#all
all:report.pdf eda-output.txt regression.RData

#data: downloads Advetising.csv to data/
data:
	cd data;curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> Advertising.csv

#clean: removes report documents