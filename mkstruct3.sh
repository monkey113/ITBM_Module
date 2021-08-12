#!/bin/bash
# Name:		mkstruct3
# Description:	This iteration of mksctruct allows to define how man subdirectories will be generated
# Autor:	Ivan Brunner
# Version:	1.0
# Date:		20210812 
# ================================== 

#exec 2>/dev/null

className=${className:-"Kurs"}
dirLevels=${dirLevels:-"3"}

if [[ -n $1 ]]; then
	className=$1
fi

if [ -n $2 -a $2 -eq $2 ]; then
	echo "Levels: $2"
	dirLevels=$2
else
	echo "Subdirecotry levels not specified, using default of 3"
fi


rootFolder=~/mkstruct/$className

rm -rf $rootFolder

if mkdir -p $rootFolder; then		# if the directory exists, mkdir will output Exit Code 1 and thus not trigger the if-condition.
	while [[ $dirLevels -gt 0 ]]; do
		        mkdir -p "$rootFolder/block$dirLevels/aufgaben" "$rootFolder/block$dirLevels/loesungen"
			        let dirLevels--
			done
			exit 0
elif ! mkdir -p $rootFolder; then 
	echo "Direcotry already exists. Abort."
	exit 1
fi
