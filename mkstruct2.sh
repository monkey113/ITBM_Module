#!/bin/bash

exec 2>/dev/null

KURSNAME=${KURSNAME:-"Kurs"}

if [[ ! -z $1 ]]; then
	KURSNAME=$1
fi

rootfolder=~/mkstruct/$KURSNAME

if mkdir $rootfolder; then
	echo "mkdir -p $rootfolder"
	echo "mkdir $rootfolder/block1"
	echo "cd $rootfolder/block1"
	exit 0
fi

echo "Ordner kann nicht angelegt werden"
exit 1

# I'm just a Comment...
