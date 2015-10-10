#!/bin/bash

# Wrote that joke of a script to help a guy pass his OS class.
# Why are at least 2 arguments required when nothing depends on them?
# No idea, it was in the problem statement.

# bash nikola_script.sh 10 12

if [ "$#" -gt 1 ]
then
	for i in {1..5}
	do
		for j in $(seq $i)
		do
			echo -n "${j} "
		done
		echo
	done
fi

