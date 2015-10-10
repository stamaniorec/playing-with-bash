#!/bin/bash

seconds_ones=0
seconds_tens=0
minutes=0

while [ 1 ]; do
    clear
    echo "Time elapsed: $minutes:$seconds_tens$seconds_ones"
    let seconds_ones+=1

    if [ "$seconds_ones" -gt 9 ]; then
        let seconds_tens+=1
        seconds_ones=0
    fi

    if [ "$seconds_tens" -ge 6 ]; then
        seconds_tens=0
        let minutes+=1
    fi

    sleep 1
done
