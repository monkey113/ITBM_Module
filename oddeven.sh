#!/bin/bash
# Name:		oddeven2.sh
# Description:	Script gibt Gerade aus wenn  ohne Rest durch 2 teilbar ist, ansonsten Ungerade
# Autor:	Ivan Brunner
# Version:	1.0
# Datum:	20210811 
# ================================== 

modulo=$(($1%2))

if [ $modulo -eq 0 ]; then
	echo "Gerade"
else
	echo "Ungerade"
fi
