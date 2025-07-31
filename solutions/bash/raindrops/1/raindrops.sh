#!/usr/bin/env bash

set -o nounset

main() {

  if (( $# == 0 ))
  then
    echo "Usage: raindrops <number>"
    exit 1
  fi

  result=""

  if (( $1 % 3 == 0))
  then
    result="$result"Pling
  fi

  if (( $1 % 5 == 0))
  then
    result="$result"Plang
  fi

  if (( $1 % 7 == 0))
  then
    result="$result"Plong
  fi

  if [[ -z "$result" ]]
  then
    echo $1
  else
    echo $result
  fi
}

main "$@"
