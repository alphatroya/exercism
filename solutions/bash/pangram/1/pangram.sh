#!/usr/bin/env bash

main() {
  lovercased="${1,,}"
  filtered_input="${lovercased//[[:digit:][:punct:][:space:]]}"

  if (( ${#filtered_input} == 0 )); then
    echo "false"
    exit
  fi

  for x in {a..z}
  do
    if [[ ! $filtered_input =~ $x ]]; then
      echo "false"
      exit
    fi

    filtered_input=${filtered_input//$x}
  done

  if ((${#filtered_input} == 0)); then
    echo "true"
  else
    echo "false"
  fi

}

main "$@"
