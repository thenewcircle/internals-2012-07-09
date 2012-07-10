#!/bin/bash
DUPDEVDIR=device/marakana/alpha
DUPSRCFIL=build/envsetup.sh

# calculate DUPTO and DUPFROM
if [ ! -d $DUPDEVDIR ]; then
	echo >&2 "no $DUPDEVDIR. You're not in the right directory."
	return 1
fi
unset DUPTO
for DUPTEST in $(find . -mindepth 1 -maxdepth 1 -type d -printf "%P\n"); do
	if [ -f $DUPTEST/$DUPSRCFIL ]; then
		if [ ! -u $DUPTO ]; then
			echo >&2 "More than one android directory. Fail."
			return 1
		fi
		DUPTO=$PWD/$DUPTEST
	fi
done
unset DUPTEST
DUPFROM=$PWD/device

function dup(){ 
	part=${PWD:${#DUPFROM}}
	mkdir -p $DUPTO/device/$part && cp $1 $DUPTO/device/$part
}

unset DUPDEVDIR
unset DUPSRCFIL
