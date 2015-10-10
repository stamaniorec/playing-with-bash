#!/bin/bash

FILE="$1"
NEW_FILE="${FILE%.csv}_result.csv"

if ! [ -f "$FILE" ]; then
    echo "$FILE: No such file exists."
    exit 1
fi

# --- if the file is not empty, clear it
touch "$NEW_FILE"
if [ -s "$NEW_FILE" ]
then
    truncate -s 0 "$NEW_FILE"    
fi

while read line 
do
    # Get x from the line (index,x)
    CURRENT_NUMBER=`echo -n $line | cut -d"," -f2`
    
    # Generate y <= x/2
    # Problem statement says < x/2 but this doesn't work for x in {0,1} 
    while [ 1 ]; do
        RAND=$(( RANDOM % (CURRENT_NUMBER+1) ))        
    if [[ `echo "$RAND <= $CURRENT_NUMBER / 2" | bc -l` -ne 0 ]]; then
                break  
        fi
    done    
    
    echo "$line,$RAND" >> "$NEW_FILE"

done < "$FILE"
