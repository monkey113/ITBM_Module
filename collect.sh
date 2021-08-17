#!/bin/bash
# Name:		collect
# Description:	Accepts three Parameters: A file extension, a source dir and a target dir. When executed correctly, collect.sh will copy all matching files from the source- to the target dir.
# Autor:	Ivan Brunner
# Version:	1.1
# Date:		20210816 
# ================================== 

fileExt=$1
srcDir=$2
trgDir=$3

if [ -z $3 ] || ! [[ -d $2 ]]; then
	echo "Usage: $(basename $0) [File extension ] [source dir] [target dir]"
	if ! [[ -d $2 ]]; then	#this checks if $2, the source dir, is a directory, and if not exits the script.
		echo "$2 is not a valid directory"
		exit 1
	fi
	exit 1
fi

if ! [ -d $trgDir ] || ! [ -w $trgDir ] ; then # condition is met if the target dir is either non-existing or non-writeable
	if ! mkdir $trgDir 2>/dev/null; then   # if creating the directory with mkdir throws an error, the script will stop. THis could potentially lead to problems if there's more than one folder to create (in a scenario where you'd use mkdir with the -p switch). I/O recirection of stderr is required, otherwise it'd show an mkdir error on stdout.
		echo "Couldn't create target dir. Wrong Permissions?"
		exit 2
	fi
	echo "Target Dir is non-existing. Creating it." # if the dir is non-existent but didn't meet the condition of being non-writtable, it'll be created in the next step. The user is norified about this.
	mkdir -p $trgDir # creating the directory and repective parent-directories
fi

fileList=$(find $srcDir -name "*.$fileExt" -type f) # assembling and exectuing the simple find command with the given variables and write it into a variable

for file in $fileList; do # entering for-loop with the variable that was populated in the line before
	cp $file $trgDir # simple copy command for every file in the variable that met the pattern of the find command
	echo "Copying $file to $trgDir" # output to stdout to notify the user what happens
done

exit 0 # if this point is reached, it can be assumed that everthing worked as intendend. Thus Exit Code 0.
