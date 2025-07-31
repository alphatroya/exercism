#!/usr/bin/env bash

set -o nounset

main() {
  input=$(echo $1 | tr '[:lower:]' '[:upper:]')

  a=0
  c=0
  g=0
  t=0

  for ((i=0;i<${#input};i++)) do
    if [[ "${input:i:1}" == 'A' ]]; then
      (( a++ ))
    elif [[ "${input:i:1}" == 'C' ]]; then
      (( c++ ))
    elif [[ "${input:i:1}" == 'G' ]]; then
      (( g++ ))
    elif [[ "${input:i:1}" == 'T' ]]; then
      (( t++ ))
    else
      echo 'Invalid nucleotide in strand'
      exit 1
    fi
  done

  echo "A: $a"
  echo "C: $c"
  echo "G: $g"
  echo "T: $t"
}

main "$@"
