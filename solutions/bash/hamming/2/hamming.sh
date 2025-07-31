#!/usr/bin/env bash

set -o nounset

main() {
  if (( $# != 2 )); then
    echo "Usage: $0 <string1> <string2>"
    exit 1
  fi

  if (( ${#1} != ${#2} )); then
    echo 'left and right strands must be of equal length'
    exit 1
  fi

  result=0
  for ((i=0;i<${#1};i++)) do
    if [[ ${1:i-1:1} != ${2:i-1:1} ]]; then
      ((result++))
    fi
  done
  echo "$result"
}

main "$@"
