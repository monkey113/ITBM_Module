#!/bin/bash
# Name:		vergleiche2
# Description:	Vergleicht  und  und gibt aus, ob welche Zahl gleich gross istahl grösser ist oder ob die Zahlen gleich gross sind
# Autor:	Ivan Brunner
# Version:	1.0
# Datum:	20210811 
# ================================== 

#if ! [[ $1 -eq $1 ]] || ! [[ $2 -eq $2 ]] ; then
#	echo "Bitte Ganzzahlen eingeben"
#	exit 1
#fi

if ! [ $1 -eq $1 ] 2>/dev/null; then
	echo "$1 ist keine Ganzzahl"
	exit 1
fi

if ! [ $2 -eq $2 ] 2>/dev/null; then
	echo "$2 ist keine Ganzzahl"
	exit 1
fi

if [[ -z $1 ]]; then
	echo "Usage: $(basename $0) Zahl1 Zahl2"
	exit 1
fi

if [[ $1 -gt $2 ]]; then
	echo "$1 ist grösser als $2"
elif [[ $2 -gt $1 ]]; then
	echo "$2 ist grösser als $1"
else
	echo "$1 ist gleich $2"
fi

