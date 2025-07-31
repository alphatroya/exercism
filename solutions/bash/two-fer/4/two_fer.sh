#!/usr/bin/env bash

set -o nounset

main() {
  name="you"
  if (($# != 0))
  then
    name="$@"
  fi
  echo "One for $name, one for me."
}

main $@

