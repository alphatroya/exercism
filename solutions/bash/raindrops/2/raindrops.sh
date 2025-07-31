#!/usr/bin/env bash

set -o nounset

main() {

  if (( $# != 1 )); then
    echo "Usage: raindrops <number>"
    exit 1
  fi

  result=""

  (( $1 % 3 == 0)) && result="$result"Pling

  (( $1 % 5 == 0)) && result="$result"Plang

  (( $1 % 7 == 0)) && result="$result"Plong

  if [[ -z "$result" ]]; then
    echo "$1"
  else
    echo $result
  fi
}

main "$@"
