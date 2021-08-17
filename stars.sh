#!/bin/bash
# Name:		stars
# Description:	Has to be executed with a number () and will show the amount fo stars on stdout
# Autor:	Ivan Brunner
# Version:	1.0
# Date:		20210817 
# ================================== 

amntStars=$1

if [ -z $1 ] || ! [ $1 -eq $1 ] 2>/dev/null; then
	echo "Usage: $(basename $0) [desired amount of stars (integer)]"
	exit
fi

for (($amntStars; amntStars >= 1; amntStars--)); do
	# stars+="*"   #non-working attempt, as the wildcard gets expanded by the shell itself, while executing. Neither Escape characters nor escaping can fix that.
	echo -n \* # got this line from the sample solutions as I couldn't find a work-around for the shell-expansion problem
done
