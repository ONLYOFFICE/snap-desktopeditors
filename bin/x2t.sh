#!/bin/sh

LOG_FILE=/home/ubuntu/x2t.log
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo ========= Log begin ============ >> $LOG_FILE
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH >> $LOG_FILE
exec $SCRIPTPATH/x2t.bin "$@" >> $LOG_FILE
echo ========= Log end ============== >> $LOG_FILE
