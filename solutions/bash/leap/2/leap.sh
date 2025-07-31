#!/usr/bin/env bash

if [ "$#" -ne 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]]
then
  echo "Usage: $0 <year>"
  exit 1
fi

if !(( $1 % 4 )) && (( $1 % 100)) || !(( $1 % 400 ))
then
  echo true
else
  echo false
fi
