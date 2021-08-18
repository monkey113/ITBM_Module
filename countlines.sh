# !/bin/bash
# Name:		countlines
# Description:	Outputs the via $1 defined file with numbered lines and the total lines as well
# Author:	Ivan Brunner
# Version:	1.0
# Date:		20210818
# ================================== 

textfile=$1
counter=0

if [[ -z $1 ]]; then
	echo "Usage: $(basename $0) [path to textfile]"
	exit 1
fi

while read zeile; do
	let counter++
	echo "$counter	$zeile"
done < $textfile

echo "$1: Read $counter lines"
