#!/usr/bin/env bash

set -o nounset

main() {
  echo "One for $1, one for me."
}

if [[ $# == 0 ]]
then
  main "you"
else
  main $1
fi
