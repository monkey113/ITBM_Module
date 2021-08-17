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


