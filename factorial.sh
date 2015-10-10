#!/bin/bash

function factorial() 
{
	let fact=1
	let n=$1

	while [ $n -gt 0 ]
	do
		let fact*=$n
		let n-=1	
	done
	
	echo $fact
}

echo -n  "Enter a number: "
read num
echo -n "$num! = "
fact=$(factorial $num)
echo $fact

