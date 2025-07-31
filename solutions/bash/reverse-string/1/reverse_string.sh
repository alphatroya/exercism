#!/usr/bin/env bash

result=""
for ((i=${#1};i>=0;i--))
do
  result="$result${1:$i:1}"
done
echo $result
