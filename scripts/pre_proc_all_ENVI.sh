#/usr/bin/env bash
# takes directory to ENVISAT .N1 files and runs ENVI_SLC_pre_process on them
DATA_DIR=$1 # Set the directory for the data to first arg
CUR_DIR=${pwd}
cd $DATA_DIR # Change to set dir
rm lines.txt # removing any old lines .txt file
ls *.N1 > lines.txt # get N1 files in dir


cat lines.txt | while read line # loop through each file name 

do
    y=${line%.N1} # remove the .N1 file extensiion because ENVI_SLC_pre_process does not like them
    ENVI_SLC_pre_process $y 0s # run the pre processing
done
rm lines.txt

cd $CUR_DIR #taking you back to directory
