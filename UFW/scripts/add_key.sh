#!/bin/bash

HOST=$1
FIX=$2

if [ "$FIX" == "fix" ]
then
	ssh $HOST "touch ~/.ssh/authorized_keys && chmod 644 ~/.ssh/authorized_keys"
fi

cat ~/.ssh/id_rsa.pub | ssh $HOST "cat >> ~/.ssh/authorized_keys"
