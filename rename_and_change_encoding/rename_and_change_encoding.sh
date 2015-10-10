#!/bin/bash

for file in *.txt
do
    # Take the name and substitute all spaces with underscores
    new_name=`echo "$file" | tr ' ' '_' `

    # If there are spaces in the original name change it 
    if [ "$new_name" != "$file" ]; then
        mv "$file" "$new_name"
    fi

    # Get the current encoding
    cur_encoding="$(file -bi "$new_name"|awk -F "=" '{print $2}')"  
    
    # Screws up the original utf-8 without this check
    if [ "$cur_encoding" != "utf-8" ]; then
        iconv -f windows-1251 -t utf-8 < "$new_name" > result.txt
        rm "$new_name"
        mv result.txt "$new_name"
        # I could have used sponge, but then I'd have had an additional dependency on moreutils 
    fi

done
