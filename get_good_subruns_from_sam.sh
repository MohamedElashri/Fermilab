#!/bin/bash

# This program will extract all of the good subruns from SAM run by run.

export DATE=$(date +%y%m%d_%H%M)
DIRECTORY=/nova/app/users/mfrank/src/trigger_live_time/sam_files

for RUN in `seq 19728 20752`;
# for RUN in `seq 19728 19728`;
do
    date
    echo "querying SAM for run ${RUN} ..."
    FILENAME=${DATE}_Good_Subruns_r${RUN}.samlist
    # echo "I like run $RUN" > $DIRECTORY/$FILENAME;
    SAM_QUERY="defname: isgood_fd_prod4 and online.runnumber = ${RUN} and data_tier raw and online.stream DDslowmono and novagr_ngood_cont_diblock > 13 with novagr_tag v5.8"
    # SAM_QUEY="online.runnumber = ${RUN} and data_tier raw and online.stream DDslowmono"
    echo samweb list-files $SAM_QUERY
    samweb list-files $SAM_QUERY > $DIRECTORY/$FILENAME;
    echo "... done"
    if [ ! -e $DIRECTORY/$FILENAME ]
    then
	echo "file $FILENAME was not written ... exiting"
	exit 1
    fi
    date
    echo
    echo
done
