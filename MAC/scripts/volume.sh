#!/bin/bash

volume="osascript -e "
name=$1

#echo "$name"

case $name in
	0) $volume "set Volume 0" ;;
	5) $volume "set Volume 5" ;;
	7) $volume "set Volume 7" ;;
	10) $volume "set Volume 10" ;;
	*) echo "fuck you";;
esac

