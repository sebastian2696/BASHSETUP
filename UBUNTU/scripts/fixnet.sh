#!/bin/bash

int1=$1
int2=$2

if [ -z $int1 ]
then
	echo -e "** ERROR: Please provide at least one interface **"
	exit 1
fi

echo -e "** Fixing routing table **"

echo -e "** Interface $int1 down... **"
sudo ifconfig $int1 down

if [ -n $int2 ]
then
	echo -e "** Interface $int2 down... **"
	sudo ifconfig $int2 down
fi

echo -e "** Flushing routes five times... **"
for i in `seq 1 5`
do
	sudo route flush
done

echo -e "** Interface $int1 up! **"
sudo ifconfig $int1 up

if [ -n $int2 ]
then
	echo -e "** Interface $int2 up! **"
	sudo ifconfig en3 up
fi

echo -e "** DONE Fixing routing table **"
