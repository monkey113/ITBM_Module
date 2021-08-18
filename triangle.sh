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

for ((counter=1; counter <= amntStars; counter++)); do		# seting a counter. Loop continues as long as counter is not equal to the desired amount if stars. Counter gets increased after every iteration. This is the same as in the stars.sh file.
	for ((counter2=1; counter2 <= counter; counter2++)); do # nested for-Loop beginns here. A second counter is defined. The loops condition is met as long as counter2 doesn't equal the counter of the main-loop. Thus it runs every iteration once more than in the last until the counter of the main-loop reaches the desired amount of stars). The counter of this sub-loop gets upped after every itearation to finally match the counter of the main-loop.
		echo -n \* # got this from the official solutions as I had problems with shell expansion. I tried an attempt where the stars get written in variable (appending) using variable+="*". But this always gets expanded by the shell during execution, so no valid attempt for this exact case (using wildcards).
	done
	echo "" # way to make a new line after every iteration, otherwise the stars will be written on the same line due to the behavior of echo -n
done
