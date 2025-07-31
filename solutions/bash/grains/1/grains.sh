#!/usr/bin/env bash

set -o nounset

main() {
  if [[ $1 == "total" ]]; then
    bc <<< '2^64 - 1'
    exit
  fi
  if (($1 < 1 || $1 > 64)); then
    echo "Error: invalid input"
    exit 1
  fi
  number=$(($1 - 1))
  bc <<< 2^$number
}

main "$@"
