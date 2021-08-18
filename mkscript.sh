# !/bin/bash
# Name:		mkcript
# Description:	creates the file for a script and generates this header based on user input.
# Autor:	Ivan Brunner
# Version:	2.0
# Date:		20210818
# ==================================

# defining variables

filename=""
descr=""
author=""
version=""
date=$(date +"%Y%m%d")

# Header template

line1="# !/bin/bash"
line2="# Name:"
line3="# Description:"
line4="# Author:"
line5="# Version:"
line6="# Date:"
line7="# ================================== "


if ! [ $1 == "-i" ] && [[ $# -ne 4 ]]; then # the script can either be used interactively or by defining $1-4. If none of this conditions is met, an error message appears and the script is exited.
	echo  "Usage: $(basename $0) [Scriptname] [Description] [Author] [Version] or use -i for interactive mode."
	exit 1
fi

# interactive Mode
if [ $1 == "-i" ]; then
	echo ""
	echo "-i detected. Entering interactive mode." # this is just to confirm the user that he's entered interacitve mode
	echo ""

	while true; do
		read -p "Enter Filename (without extension): " filename
		[[ ! -e $filename.sh ]] && break # if file isn't existing, loop is exited
		echo "File already exists. Enter a new filename." # message just gets prompted if above condition isn't met, meaning the file already exists
	done

echo ""
	
	while [[ -z $descr ]]; do # loop as long as variable is empty
		IFS= read -p "Enter Description: " descr # "IFS=" allows for input with whitespace
	done

echo ""

	while [[ -z $author ]]; do
		IFS= read -p "Enter Author: " author # "IFS=" allows for input with whitespace
	done

echo ""

	while [[ -z $version ]] ; do
		read -p "Enter Version: " version
	done

echo ""

else
	if [[ -e $filename ]]; then # check for mode where $1-4 is defined when executed. In interactive mode, this is tested "on the go"
		echo "File already exists. Enter a new filename."
		exit 1
	else # if the test is passed, the variabled get assigned with their correspondign values (see Usage)
		filename=$1
		descr=$2
		author=$3
		version=$4
	fi
fi

echo ""

echo "Preview of header:"
line1Final=$(echo "$line1") && echo "$line1Final" # to keep it simple I decided to assemble the final lines into new variables
line2Final=$(echo "$line2		$filename") && echo "$line2Final"
line3Final=$(echo "$line3	$descr") && echo "$line3Final"
line4Final=$(echo "$line4	$author") && echo "$line4Final"
line5Final=$(echo "$line5	$version") && echo "$line5Final"
line6Final=$(echo "$line6		$date") && echo "$line6Final"
line7Final=$(echo "$line7") && echo "$line7Final"
echo ""

while true; do # I wanted th euser to be able to confirm what and where will be written
	read -p "Write to new file $filename? (y/n): " write
	[ $write == "y" ] && break
	[ $write == "n" ] && exit 3
done

# I wanted to work with a single template and a single write section and was able to accomplish that.

echo "$line1Final" > $filename.sh
echo "$line2Final" >> $filename.sh
echo "$line3Final" >> $filename.sh
echo "$line4Final" >> $filename.sh
echo "$line5Final" >> $filename.sh
echo "$line6Final" >> $filename.sh
echo "$line7Final" >> $filename.sh
echo "" >> $filename.sh

chmod +x $filename.sh
