#!/usr/bin/env bash

set -o nounset

main() {
  if (( $# != 2 )); then
    exit 1
  fi

  cmd="$1"
  number="$2"
  sum=$(( number * (number + 1) / 2))
  square_of_sum=$(( sum * sum ))
  sum_of_squares=$(( number * (number + 1) * (2 * number + 1) / 6))

  if [[ $cmd == "square_of_sum" ]]; then
    echo $square_of_sum
  elif [[ $cmd == "sum_of_squares" ]]; then
    echo $sum_of_squares
  elif [[ $cmd == "difference" ]]; then
    echo $((square_of_sum - sum_of_squares))
  fi
}

main "$@"
