#!/bin/bash
# Name:		triangle
# Description:	sister-script to stars.sh but shows the stars as a triangle over multiple lines of output
# Autor:	Ivan Brunner
# Version:	1.0
# Date:		20210817 
# ================================== 

amntStars=$1

if [ -z $1 ] || ! [ $1 -eq $1 ] 2>/dev/null; then
	echo "Usage: $(basename $0) [desired amount of stars (integer)]"
	exit
fi

for ((counter=1; counter <= amntStars; counter++)); do
	for ((counter2=1; counter2 <= counter; counter2++)); do
	echo -n \*
	done
	echo ""
done
