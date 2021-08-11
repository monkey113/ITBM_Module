# !/bin/bash

filename=$1.sh

if [[ $# -ne 4 ]]; then
	echo  "Fehler. Es müssen genau 4 Parameter angegeben werden. Usage: mkscript_1.sh [Scriptname] [Description] [Author] [Version]"
	exit 1
fi

if [ -e $filename  ]; then
	echo "Fehler: Die Datei $filename existiert bereits. Bitte wählen Sie einen anderen Namen."
	exit 2
fi


echo "#!/bin/bash" > $filename
echo "# Name:		$1" >> $filename
echo "# Description:	$2" >> $filename
echo "# Autor:	$3" >> $filename
echo "# Version:	$4" >> $filename
echo "# Datum:	$(date +"%Y%m%d") " >> $filename
echo "# ================================== " >> $filename
