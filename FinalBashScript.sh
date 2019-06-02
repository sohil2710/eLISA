#!/bin/bash

#This will be the main script for the program
#It will run the Python script and then the R script
#It will just take the file to be analyzed as the input
#Usage = sh bashscript inputfile.txt

inputerror=".........
WARNING: INPUT ERROR.
/namebofourprogram/ requires one input - the name of your input file.
Example usage:
	sh codedraft.py inputfile.txt
Please check input and try again
........."

. /u/local/Modules/default/init/modules.sh

if [ "$#" != "1" ]; then
        echo "$inputerror"
else
    	module load python/3
        echo "........."
        echo "sorting input file"
        python codedraft1.py $1
        echo "........."
        sed -i '/^$/d' finalsamplecolumn*.txt
        echo "searching spceies database"
        echo "........."
        #load R and run the R code
	Rscript R_code.R
fi
