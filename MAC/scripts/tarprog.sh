#!/bin/bash

SRC=$1
DST=$2

OS=`uname`

if [[ $OS == "Darwin" ]]
then
	tar cf - $SRC -P | pv -s $(($(du -sk $SRC | awk '{print $1}') * 1024)) | gzip > $DST
elif [[ "$OS" == "Linux" ]]
then
	tar cf - /$SRC -P | pv -s $(du -sb /$SRC | awk '{print $1}') | gzip > $DST
fi
