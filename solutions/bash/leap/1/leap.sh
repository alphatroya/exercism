#!/usr/bin/env bash

if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$#" -ne 1 ]
then
  echo 'Usage: leap.sh <year>'
  exit 1
fi

if !(( $1 % 4 )) && (( $1 % 100)) || !(( $1 % 400 ))
then
  echo true
else
  echo false
fi
