#!/bin/bash

NN_NUM=$1

re='^[0-9]+$'

if ! [[ $NN_NUM =~ $re ]]
then
    echo -e "ERROR!" >&2
    echo -e "USAGE:" >&2
    echo -e "\tsshrm.sh NN_NUM" >&2
    exit 1
else
    ssh-keygen -f "/home/neel/.ssh/known_hosts" -R 192.168.1.1$NN_NUM
    ssh-keygen -f "/home/neel/.ssh/known_hosts" -R nimbnode$NN_NUM
fi
