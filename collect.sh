#!/bin/bash
# Name:		collect
# Description:	Accepts three Parameters: A file extension, a source dir and a target dir. When executed correctly, collect.sh will copy all matching files from the source- to the target dir.
# Autor:	Ivan Brunner
# Version:	1.0
# Date:		20210816 
# ================================== 

fileExt=$1
srcDir=$2
trgDir=$3

if [ -z $3 ] || ! [[ -d $2 ]]; then
	echo "Usage: $(basename $0) [File extension ] [source dir] [target dir]"
	if ! [[ -d $2 ]]; then
		echo "$2 is not a valid directory"
		exit 1
	fi
	exit 1
fi

if ! [ -d $trgDir ] || ! [ -w $trgDir ] ; then
	if ! mkdir $trgDir 2>/dev/null; then
		echo "Couldn't create target dir. Wrong Permissions?"
		exit 2
	fi
	echo "Target Dir is non-existing. Creating it."
	mkdir -p $trgDir
fi

fileList=$(find $srcDir -name "*.$fileExt" -type f)

for file in $fileList; do
	cp $file $trgDir
	echo "Copying $file to $trgDir" 
done

exit 0
