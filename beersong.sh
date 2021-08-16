#!/bin/bash
# Name:		beersong
# Description:	This script generates a song about beer based on how many bottles are defined when executed
# Autor:	Ivan Brunner
# Version:	1.0
# Date:		20210816 
# ================================== 

counter=$1

if [ -z $1 ] || ! [ $1 -eq $1 ] 2>/dev/null; then
	echo "Usage: $(basename $0) [amount of beer bottles (integer)]"
	exit 1
fi

while [ $counter -gt 0 ]; do
	if [ $counter -ge 2 ]; then
		echo "$counter bottles of beer in the fridge"
        	echo "$counter bottles of beer"
		echo "take one out"
	else
		echo "$counter bottle beer in the fridge"
		echo "$counter bottle beer"
		echo "take it out"
	fi

	echo "drink from it"
	echo ""
	
	let counter--
done

echo "The fridge seems to be empty"
