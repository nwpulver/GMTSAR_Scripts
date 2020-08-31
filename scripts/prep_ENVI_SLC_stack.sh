#!/usr/bin/env bash
# runs xcorr on all .PRM files, taking the master as an argument 
# Example prep_ENVI_SLC_stack.sh master.PRM
master=$1
find ./*.PRM \! -name $master | sed 's|^./||' > PRMs.txt
cat PRMs.txt | while read line 
do 
	rm freq_xcorr.dat		
	filename=${line%.PRM}
#	echo $filename
#	echo $line
	echo "running xcorr on $line"
	xcorr $master $line  -xsearch 128 -ysearch 128 -nx 20 -ny 50
	echo "fitting offset for $line"
	fitoffset.csh 3 3 freq_xcorr.dat 18 >> $line
	echo "resampling $line"
	resamp $master $line $filename.PRMresamp $filename.SLCresamp 4
	echo "removing old SLCs and adding resampled" 
	rm $filename.SLC
	mv $filename.SLCresamp $filename.SLC
	cp $filename.PRMresamp $filename.PRM
done
rm PRMs.txt
