#!/bin/bash

clear
echo "Welcome! This program was developed on 28.07.2014"
echo "to generate a csv file in the format "
echo "(index,random_umber) for another program for a "
echo -e "yellow belt exam at ELSYS, supposedly.\n\n" 

sleep 2
echo "Please press enter to continue."
read

clear
echo "Enter a file name where you want to store the data in."
while [ 1 ]
do
    read FILENAME
    
    if [ -z "$FILENAME" ]
    then
        echo "Please enter something!"
    else
        break
    fi
done

# if the file is not empty 
if [ -s "$FILENAME" ]
then
    # clear it 
    > $FILENAME
fi

clear

echo "Thank you."
sleep 1
echo "Now please enter how many numbers you want to generate."
while [ 1 ]
do
    read TARGET_NUMBER

    if [ -z "$TARGET_NUMBER" ]
    then
        echo "Please enter something!"
        continue
    fi

    echo $TARGET_NUMBER | grep [^0-9] &> /dev/null

    if [ $? -ne 0 ] # if TARGET_NUMBER is composed of digits only
    then
        break
    fi
    echo "Error. Please enter positive integers only!" 
    sleep 1
    echo "Let's try one more time..."
done
clear

echo "Great, just one last thing..."
sleep 1
echo "Please enter what limit to apply to the random number generation."
echo "Enter 0 if you have no preference."
while [ 1 ]
do
    read LIMIT

    if [ -z "$LIMIT" ]
    then
        echo "Please enter something!"
        continue
    fi

    echo $LIMIT | grep [^0-9] &> /dev/null

    if [ $? -ne 0 ]
    then
        if [ "$LIMIT" -eq "0" ]
        then
            LIMIT_SWITCH=0
        else
            LIMIT_SWITCH=1
        fi

        break
    fi
    echo "Error. Please enter positive integers only! "
    sleep 1
    echo "And there we go again..."
done
clear

for((i=0; i < $TARGET_NUMBER; ++i))
do
    echo -n "$i," >> $FILENAME
    
    if [[ "$LIMIT_SWITCH" -eq "0" ]]
    then
        RAND=$((RANDOM))
    elif [[ "$LIMIT_SWITCH" -eq "1" ]]
    then
        RAND=$(($RANDOM % LIMIT))
    fi
    
    echo "$RAND" >> $FILENAME
done

for((i=0; i < 5; ++i))
do
    echo -n ". "
    sleep 1
done
echo " DONE!!!"
