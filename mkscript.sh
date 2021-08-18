# !/bin/bash
# Name:		mkcript
# Description:	creates the file for a script and generates this header based on user input.
# Autor:	Ivan Brunner
# Version:	2.0
# Date:		20210818
# ==================================

filename=""
descr=""
author=""
version=""
date=$(date +"%Y%m%d")


if ! [ $1 == "-i" ] && [[ $# -ne 4 ]]; then
	echo  "Usage: $(basename $0) [Scriptname] [Description] [Author] [Version] or use -i for interactive mode."
	exit 1
fi

# interactive Mode
if [ $1 == "-i" ]; then
	echo ""
	echo "-i detected. Entering interactive mode."
	echo ""

	while True; do
		read -p "Enter Filename (without extension): " filename
		[ ! -e $filename ] && break
	done

	echo ""
	
	while [ -n $descr ]; do
		read -p "Enter Description: " descr
	done

	echo ""

	while [ -n $version ] ; do
		read -p "Enter Version: " version
	done

	echo ""

else; then
	if [ -e $filename ]; then
		echo "Fehler: Die Datei $filename existiert bereits. Bitte wählen Sie einen anderen Namen."
		exit 2
	else
		filename=$1
		descr=$2
		author=$3
		version=$4
	fi
fi

while True; do
	echo ""
	echo ""
	echo "Preview of header:"
	echo "# !/bin/bash"
	echo "# Name:           $filename"
	echo "# Description:    $descr"
	echo "# Author: $author"
	echo "# Version:        $version"
	echo "# Date:           $date"
	echo "# ================================== " >>
	echo ""
	read -p "Write to new file $filename? (y/n): " write
	[ $write == "y" ] && break
	[ $write == "n" ] && exit 3


echo "# !/bin/bash" > $filename.sh
echo "# Name:		$filename" >> $filename.sh
echo "# Description:	$descr" >> $filename.sh
echo "# Author:	$author" >> $filename.sh
echo "# Version:	$version" >> $filename.sh
echo "# Date:		$date" >> $filename.sh
echo "# ================================== " >> $filename.sh
