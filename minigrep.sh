# !/bin/bash
# Name:		minigrep1
# Description:	Searches a file for the user defined words ($1+) and outputs the respective lines.
# Author:	Ivan Brunner
# Version:	1.0
# Date:		20210818
# ================================== 
textfile=$1
results=0

if ! [[ -e $1 ]] || [[ -z $1 ]]; then
	echo "Usage: $(basename $0) [path to textfile] [search words]"
	exit 1
fi

shift

while read zeile; do
	for word in $zeile; do
		for searchword in $@; do
			if [[ $searchword == $word ]]; then
				echo $zeile && let results++
			fi
		done
	done
done < $textfile

echo ""
echo "Reached end of File \"$(basename $textfile)\". Found $results matching line(s)."
