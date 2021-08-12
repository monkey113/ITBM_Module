#!/bin/bash
# Name:		paramtest5
# Description:	Giving out all Arguments with help of a While-Loop
# Autor:	Ivan Brunner
# Version:	1.0
# Datum:	20210812 
# ================================== 

paramCnt=$#
actualParam=1

if [ $# -eq 0 ]; then
	echo "Usage: $(basename $0) [min. 1 Argument]"
	exit 1
fi

echo "Parameter Count: $paramCnt"
echo ""
while [ $paramCnt -gt 0 ]; do
	echo "Parameter $actualParam: $1"
	shift
	let actualParam++
	let paramCnt--
done
exit 0
