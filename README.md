## Example runs of scripts 

###  pre_proc_all_ENVI.sh
* Get ENVI .N1 files that you want to process in a directory with path /YOUR/PATH/
*     pre_proc_all_ENVI.sh /YOUR/PATH/
* Meant to be run in the raw directory 

### prep_ENVI_SLC_stack.sh
* This one is a work in progress. I think I messed this up somewhere but I am not sure where.
* My goal is to eventually get this to an all-in-one script that can also run intf_batch.csh but currently it is not the case
* The workflow for this script was derived from guidance on [this issue thread](https://github.com/gmtsar/gmtsar/issues/47)
* To run this script, you need your pre-processed ENVI SLCs and you need to choose a master PRM. The command is as follows:
*     prep_ENVI_SLC_stack.sh master.PRM
* Assumes this will be run from directory with PRM files
