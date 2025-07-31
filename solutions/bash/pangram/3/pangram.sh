#!/usr/bin/env bash

main() {
  lowercased="${1,,}"
  filtered_input="${lowercased//[^[:lower:]]}"

  if [[ -z $filtered_input ]]; then
    echo "false"
    exit
  fi

  for x in {a..z}
  do
    if [[ ! $filtered_input = *$x* ]]; then
      echo "false"
      exit
    fi

    filtered_input=${filtered_input//$x}
  done

  echo "true"
}

main "$@"
