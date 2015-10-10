#!/bin/bash

which lynx &> /dev/null
if [ "$?" -ne 0 ]; then
    echo "Missing dependency: lynx"
    exit 1
fi

while getopts "f:" opt; do
    case "$opt" in
        f) EPISODE_FILE="$OPTARG";;
        \?) exit 1;;
    esac
done

if [ -z "$EPISODE_FILE" ]; then
    EPISODE_FILE='last_episode.txt'
fi

ITUNES_URL='https://itunes.apple.com/us/podcast/hello-internet/id811377230'

LATEST_EPISODE=`lynx --dump ${ITUNES_URL} | grep "H.I. #" | cut -d# -f2 | cut -d: -f1 | cut -d\  -f1 | head -n 1`

if [ -f "$EPISODE_FILE" ]; then
    LATEST_IN_FILE=`head -n 1 ${EPISODE_FILE}`
    if [ "$LATEST_IN_FILE" -lt "$LATEST_EPISODE" ]; then
        echo "$LATEST_EPISODE" > "$EPISODE_FILE"
        notify-send "HELLO INTERNET EPISODE ${LATEST_EPISODE} CAME OUT!!!"
    fi
else
    touch "$EPISODE_FILE"
    echo "$LATEST_EPISODE" > "$EPISODE_FILE"
    notify-send "The latest episode is ${LATEST_EPISODE}"
fi
