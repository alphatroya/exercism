#!/usr/bin/env bash

set -o nounset

main() {
  if [[ $1 == "total" ]]; then
    bc <<< '2^64 - 1'
  elif (($1 < 1 || $1 > 64)); then
    echo "Error: invalid input"
    exit 1
  else
    number=$(($1 - 1))
    bc <<< 2^$number
  fi
}

main "$@"
