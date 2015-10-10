#!/bin/bash

while getopts "f:" opt; do
    case "$opt" in
        f) LOG_FILE="$OPTARG";;
        \?) exit 1;;
    esac
done

if [ -z "$LOG_FILE" ]; then
    LOG_FILE='log.txt'
fi


DATE=`date +%Y-%m-%d:%H:%M:%S`
echo -n "$DATE : " >> $LOG_FILE
zenity --entry --width 300 --title 'SimpleLogger' --text 'Enter message to be logged' >> $LOG_FILE
