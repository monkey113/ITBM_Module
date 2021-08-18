# !/bin/bash
# Name:		chkdf
# Description:	Checks the usage of mounted disks and reports usage that's higher than defined via $1
# Author:	Ivan Brunner
# Version:	1.0
# Date:		20210818
# ================================== 

brdLine=$1

df --output=pcent,target | tr '%' ' ' | tail -n+2 | grep -v "$(id -u)" | grep -v snap | grep -v "/run" | while read pctFull mntPoint; do
		if [[ $brdLine -lt $pctFull ]]; then
			printf "Mountpoint %-6s has more than %3d%% usage (%d%%)\n" $mntPoint $brdLine $pctFull
		fi
	done
